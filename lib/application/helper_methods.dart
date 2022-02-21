extension HeightHelper on int {
  String cmToFeetAndInchesAndCmString() {
    int heightInInches = (this / 2.54).round();
    int feet = (heightInInches / 12).floor();
    int inches = (heightInInches - (12 * feet)).floor();

    return '$feet\' $inches" ($this cm)';
  }
}
