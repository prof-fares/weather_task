extension StringExtensions on String? {
  bool get isValidName =>
      this != null &&
      this!.isNotEmpty &&
      this!.length >= 3 &&
      RegExp(r"^[\p{L}\s]+$", unicode: true).hasMatch(this!);

  bool get isValidDescription => this != null && this!.length >= 10;

  bool get isValidPhone =>
      this != null &&
      RegExp(r"^(\+?\d{1,3})?\d{9,15}$").hasMatch(this!);

  bool get isValidInstagram =>
      this != null &&
      Uri.tryParse(this!)?.hasAbsolutePath == true &&
      this!.startsWith("https://instagram.com/");
}
