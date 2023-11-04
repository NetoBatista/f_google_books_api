library f_google_books_api;

import 'package:f_google_books_api/model/f_google_books_exception.dart';

class FGoogleBooksApi {
  final String apiKey;

  ///Initialize the FGoogleBookApis project
  ///An api key is required to initialize the api
  ///
  ///1. Access https://console.cloud.google.com/apis/credentials?hl=pt-br
  ///2. Click create api key
  ///3. Go to https://console.cloud.google.com/apis/api/books.googleapis.com and enable the Books API
  FGoogleBooksApi(this.apiKey) {
    if (apiKey.isEmpty) {
      throw FGoogleBooksApiException(
        "API key not valid. Please pass a valid API key.",
      );
    }
  }

  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
