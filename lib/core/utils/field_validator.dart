class FieldValidator {
  static String? validateUserType(String val) {
    if (val.trim().isEmpty) return "Select user type";
    return null;
  }

  static String? validateName(String val) {
    if (val.trim().isEmpty) return "Name is required";
    return null;
  }

  static String? validateDOB(String val) {
    if (val.trim().isEmpty) return "Date of birth is required";
    return null;
  }

  static String? validateEmail(String val) {
    if (val.trim().isEmpty) return "Email is required";
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(val)) return "Enter a valid email";
    return null;
  }

  static String? validatePassword(String val) {
    if (val.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  static String? validateConfirmPassword(String password, String confirm) {
    if (confirm != password) return "Passwords do not match";
    return null;
  }

  static String? validateGender(String? val) {
    if (val == null || val.trim().isEmpty) return "Please select gender";
    return null;
  }
}
