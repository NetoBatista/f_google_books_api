import 'package:f_google_books_api/f_google_books_api.dart';
import 'package:f_google_books_api/model/volume/request/volume_filter_model.dart';
import 'package:f_google_books_api/model/volume/request/volume_print_type_model.dart';
import 'package:f_google_books_api/model/volume/request/volume_request_model.dart';
import 'package:f_google_books_api/model/volume/request/volume_sorting_model.dart';
import 'package:flutter/foundation.dart';

void main() async {
  //initialize the package
  var apiKey = '';
  FGoogleBooksApi.instance.initialize(apiKey: apiKey);

  //Create a requestModel
  var requestModel = VolumeRequestModel(
    query: 'Harry Potter',
    startIndex: 0, // optional
    maxResults: 10, // optional
    epub: true, // optional
    filter: VolumeFilterModel.full, // optional
    orderBy: VolumeSortingModel.newest, // optional
    printType: VolumePrintTypeModel.all, // optional
  );

  //Await the searchBooks response
  var response = await FGoogleBooksApi.instance.searchBooks(requestModel);
  if (response != null) {
    var itemCount = response.totalItems?.toString() ?? '0';
    debugPrint('Number of books about http: $itemCount.');
  }
}
