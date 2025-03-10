
class Validation{
  static bool isValidateEmail(String email){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
  static bool isValidPhone(String phone) {
    return RegExp(r"^[0-9]{10,15}$").hasMatch(phone);
  }

  static bool isValidatePassword(String password){
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])'r'.{6,}$')
        .hasMatch(password);
  }
}