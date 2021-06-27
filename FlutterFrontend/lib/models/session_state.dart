
class SessionState {

  int _userID = 1;

  int get userID => this._userID;

  set _modifyUserID(int id) => this._userID = id;

  logOut() {
    this._modifyUserID = null;
  }
}