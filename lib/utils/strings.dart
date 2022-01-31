extension NullHelpers on String? {
  bool isNullOrEmpty() {
    return [null, ''].contains(this);
  }
}
