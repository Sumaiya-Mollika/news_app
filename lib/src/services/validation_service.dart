class ValidationService {
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return null;
    }
    return value.contains('@') ? null : 'Enter a valid email';
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return null;
    }
    return password == confirmPassword ? null : 'Passwords do not match';
  }
}
