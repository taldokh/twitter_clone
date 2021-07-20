import 'package:flutter/foundation.dart';

class LogInFormValidationState extends ChangeNotifier {
  bool _isFormValid = false;
  String _userField = "";
  String _passwordField = "";

  bool get isFormValid => this._isFormValid;

  set __isFormValid(bool newFormState) => this._isFormValid = newFormState;

  get userField => this._userField;

  get passwordField => this._passwordField;

  set userField(String updatedUserFieldLength) {
    this._userField = updatedUserFieldLength;
    _validate();
  }

  set passwordField(String updatedPasswordFieldLength) {
    this._passwordField = updatedPasswordFieldLength;
    _validate();
  }

  _validate() {
    bool val = _userField.length > 0 && _passwordField.length > 0;
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
