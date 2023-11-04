import 'package:f_google_books_api/exception/f_google_books_exception.dart';
import 'package:f_google_books_api/model/volume/request/volume_filter_model.dart';
import 'package:f_google_books_api/model/volume/request/volume_print_type_model.dart';
import 'package:f_google_books_api/model/volume/request/volume_request_model.dart';

extension VolumeRequestExtensionValidation on VolumeRequestModel {
  void validate() {
    var query = this.query;
    if (query.isEmpty) {
      throw FGoogleBooksApiException('Query - Cannot be empty');
    }

    var maxResults = this.maxResults ?? 0;
    if (maxResults > 40) {
      throw FGoogleBooksApiException(
          'MaxResults - Maximum number of results is 40');
    }

    var startIndex = this.startIndex ?? 0;
    if (startIndex < 0) {
      throw FGoogleBooksApiException('StartIndex - Cannot be less than 0');
    }

    var filter = this.filter;
    if (filter != null && !_isValidFilter(filter)) {
      throw FGoogleBooksApiException('Filter - Invalid type');
    }

    var printType = this.printType;
    if (printType != null && !_isValidPrintType(printType)) {
      throw FGoogleBooksApiException('PrintType - Invalid type');
    }
  }

  bool _isValidFilter(String filter) {
    return filter == VolumeFilterModel.ebooks ||
        filter == VolumeFilterModel.freeEbooks ||
        filter == VolumeFilterModel.full ||
        filter == VolumeFilterModel.paidEbooks ||
        filter == VolumeFilterModel.partial;
  }

  bool _isValidPrintType(String printType) {
    return printType == VolumePrintTypeModel.all ||
        printType == VolumePrintTypeModel.books ||
        printType == VolumePrintTypeModel.magazines;
  }
}
