
String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return input;
  return input.replaceRange(0, 1, input[0].toUpperCase());
}
