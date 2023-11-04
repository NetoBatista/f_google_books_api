///[optional]
///
///By default, a volumes search request returns maxResults results, where maxResults is the parameter used in pagination (above), ordered by relevance to search terms.
class VolumeSortingModel {
  ///Returns results in order of the relevance of search terms (this is the default).
  static const String relevance = "relevance";

  ///Returns results in order of most recently to least recently published.
  static const String newest = "newest";
}
