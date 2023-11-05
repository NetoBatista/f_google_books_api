import 'package:f_google_books_api/model/volume/request/volume_filter_model.dart';
import 'package:f_google_books_api/model/volume/request/volume_print_type_model.dart';
import 'package:f_google_books_api/model/volume/request/volume_sorting_model.dart';

///Parameters used in searching volumes
class VolumeRequestModel {
  ///Search for volumes that contain this text string
  String query;

  ///[optional]
  ///
  ///The position in the collection at which to start. The index of the first item is 0
  int? startIndex;

  ///[optional]
  ///
  ///The maximum number of results to return. The default is 10, and the maximum allowable value is 40.
  int? maxResults;

  ///[optional]
  ///
  ///You use the download parameter to restrict the returned results to volumes that have an available download format of epub by setting the to the value epub.
  bool? epub;

  ///[optional]
  ///
  ///You can use the filter parameter to restrict the returned results
  ///Check out the [VolumeFilterModel] class for more information
  String? filter;

  ///[optional]
  ///
  ///You can use the printType parameter to restrict the returned results to a specific print or publication type
  ///Check out the [VolumePrintTypeModel] class for more information
  String? printType;

  ///[optional]
  ///
  ///By default, a search request returns maxResults results, where maxResults is the parameter used in pagination, ordered by most relevant first.
  ///Check out the [VolumeSortingModel] class for more information
  String? orderBy;

  VolumeRequestModel({
    required this.query,
    this.startIndex,
    this.maxResults,
    this.epub,
    this.filter,
    this.printType,
    this.orderBy,
  });
}
