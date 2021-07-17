import 'package:flutter/foundation.dart';

class LogInFormValidationState extends ChangeNotifier {
  bool _isFormValid = false;
  int _userFieldLength = 0;
  int _passwordFieldLength = 0;

  bool get isFormValid => this._isFormValid;

  set __isFormValid(bool newFormState) => this._isFormValid = newFormState;

  set userFieldLength(int updatedUserFieldLength) {
    this._userFieldLength = updatedUserFieldLength;
    _validate();
  }

  set passwordFieldLength(int updatedPasswordFieldLength) {
    this._passwordFieldLength = updatedPasswordFieldLength;
    _validate();
  }

  _validate() {
    bool val = _userFieldLength > 0 && _passwordFieldLength > 0;
    if (val != isFormValid) {
      if (val) {
        this._formIsValid();
      } else {
        this._formIsInValid();
      }
    }
  }

  _formIsValid() {
    this.__isFormValid = true;
    notifyListeners();
  }

  _formIsInValid() {
    this.__isFormValid = false;
    notifyListeners();
  }
}
