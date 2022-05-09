extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> get sanitized {
    removeWhere((key, value) => value == null);
    return this;
  }
}
