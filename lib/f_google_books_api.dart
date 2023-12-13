library f_google_books_api;

import 'package:f_google_books_api/exception/f_google_books_exception.dart';
import 'package:f_google_books_api/extension/volume_request_extension_validation.dart';
import 'package:f_google_books_api/model/volume/request/volume_request_model.dart';
import 'package:f_google_books_api/model/volume/response/volume_response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FGoogleBooksApi {
  FGoogleBooksApi._();

  static final FGoogleBooksApi instance = FGoogleBooksApi._();

  final String _baseAddress = 'https://www.googleapis.com/books/v1';
  String _apiKey = '';

  ///Initialize the FGoogleBookApis project, an api key is required to initialize the api.
  ///1. Access https://console.cloud.google.com/apis/credentials
  ///2. Click create api key
  ///3. Go to https://console.cloud.google.com/apis/api/books.googleapis.com and enable the Books API
  void initialize({required String apiKey}) {
    _apiKey = apiKey;
    if (_apiKey.isEmpty) {
      throw FGoogleBooksApiException(
        "API key not valid. Please pass a valid API key.",
      );
    }
  }

  ///Performs book searches according to the parameters provided.
  ///
  ///If any parameter is invalid, an exception of the type [FGoogleBooksApiException] will be returned.
  Future<VolumeResponseModel?> searchBooks(
    VolumeRequestModel volumeRequestModel,
  ) async {
    volumeRequestModel.validate();
    var url = _getUrlVolumes(volumeRequestModel);
    var response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      return null;
    }
    var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    return VolumeResponseModel.fromJson(json);
  }

  //Gets the URL according to the parameters
  String _getUrlVolumes(
    VolumeRequestModel volumeRequestModel,
  ) {
    var response = '$_baseAddress/volumes';

    response += '?q=${volumeRequestModel.query}';
    response += '&key=$_apiKey';

    if (volumeRequestModel.startIndex != null) {
      response += '&startIndex=${volumeRequestModel.startIndex}';
    }

    if (volumeRequestModel.maxResults != null) {
      response += '&maxResults=${volumeRequestModel.maxResults}';
    }

    if (volumeRequestModel.epub == true) {
      response += '&download=epub';
    }

    if (volumeRequestModel.filter != null) {
      response += '&filter=${volumeRequestModel.filter}';
    }

    if (volumeRequestModel.printType != null) {
      response += '&printType=${volumeRequestModel.printType}';
    }

    return response;
  }
}
