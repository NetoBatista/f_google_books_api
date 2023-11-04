///Exception raised by FGoogleBooksApi
class FGoogleBooksApiException implements Exception {
  final String cause;
  FGoogleBooksApiException(this.cause);
}
