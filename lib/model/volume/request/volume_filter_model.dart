///[optional]
///
///You can use the filter parameter to restrict the returned results
class VolumeFilterModel {
  ///Returns results where at least parts of the text are previewable.
  static const String partial = "partial";

  ///Only returns results where all of the text is viewable.
  static const String full = "full";

  ///Only returns results that are free Google eBooks.
  static const String freeEbooks = "free-ebooks";

  ///Only returns results that are Google eBooks with a price.
  static const String paidEbooks = "paid-ebooks";

  ///Only returns results that are Google eBooks, paid or free. Examples of non-eBooks would be publisher content that is available in limited preview and not for sale, or magazines.
  static const String ebooks = "ebooks";
}
