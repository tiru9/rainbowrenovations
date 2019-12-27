class EmailorPhoneValidator {
  Pattern _phonePattern = r'^(?:[+0]9)?[0-9]{10}$';
  Pattern _emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String _emailOrPhone;

  EmailorPhoneValidator(this._emailOrPhone);

  isValidMailOrPhone() {
    RegExp _phoneRegex = new RegExp(_phonePattern);
    RegExp _emailRegex = new RegExp(_emailPattern);
    if (_emailOrPhone.length == 10 && (_phoneRegex.hasMatch(_emailOrPhone)))
      return true;
    else if (_emailRegex.hasMatch(_emailOrPhone))
      return true;
    else
      return false;
  }
}
