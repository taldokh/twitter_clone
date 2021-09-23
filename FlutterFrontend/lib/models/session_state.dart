import 'package:flutter/foundation.dart';

class SessionState extends ChangeNotifier {
  int _userID;

  int get userID => this._userID;

  set _modifyUserID(int id) => this._userID = id;

  logOut() {
    this._modifyUserID = null;
    notifyListeners();
  }

  logIn(int id) {
    this._modifyUserID = id;
    notifyListeners();
  }
}
