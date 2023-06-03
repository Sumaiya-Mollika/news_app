String extractErrorMessage(String input) {
  int closingBracketIndex = input.indexOf(']');
  if (closingBracketIndex != -1 && closingBracketIndex + 1 < input.length) {
    return input.substring(closingBracketIndex + 1).trim();
  }
  return 'An error occurred';
}
