import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class SessionState extends ChangeNotifier {
  int _userID = 1;

  int get userID => this._userID;

  set _modifyUserID(int id) => this._userID = id;

  logOut() {
    this._modifyUserID = null;
  }
}
