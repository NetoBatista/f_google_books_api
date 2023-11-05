import 'package:f_google_books_api/f_google_books_api.dart';
import 'package:f_google_books_api/model/volume/request/volume_filter_model.dart';
import 'package:f_google_books_api/model/volume/request/volume_print_type_model.dart';
import 'package:f_google_books_api/model/volume/request/volume_request_model.dart';
import 'package:f_google_books_api/model/volume/request/volume_sorting_model.dart';
import 'package:flutter/foundation.dart';

void main(List<String> arguments) async {
  //initialize the package
  var apiKey = '';
  var fgoogleBookApi = FGoogleBooksApi(apiKey);

  //Create a requestModel
  var requestModel = VolumeRequestModel(
    query: 'Flores para Algernon',
    startIndex: 0, // optional
    maxResults: 2, // optional
    epub: true, // optional
    filter: VolumeFilterModel.full, // optional
    orderBy: VolumeSortingModel.newest, // optional
    printType: VolumePrintTypeModel.all, // optional
  );

  //Await the searchBooks response
  var response = await fgoogleBookApi.searchBooks(requestModel);
  if (response != null) {
    var itemCount = response.totalItems?.toString() ?? '0';
    debugPrint('Number of books about http: $itemCount.');
  }
}