class FormService {
  static phoneFieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value) ||
        value.length < 10 ||
        value.length > 11) {
      return "Please enter a valid phone number";
    }
    return null;
  }

  static userNameFieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    } else if (!RegExp(r'^[ A-z]+$').hasMatch(value) ||
        value.trim().length < 4) {
      return "Please enter a valid user name";
    }
    return null;
  }
}
