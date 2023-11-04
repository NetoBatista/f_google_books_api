///[optional]
///
///You can use the printType parameter to restrict the returned results to a specific print or publication type
class VolumePrintTypeModel {
  ///Return all volume content types (no restriction). This is the default.
  static const String all = "all";

  ///Return just books.
  static const String books = "books";

  ///Return just magazines.
  static const String magazines = "magazines";
}
