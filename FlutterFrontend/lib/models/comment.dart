// data object model that holds all the information related to a post comment
class Comment {
  final int _commentID;
  final int _userID;
  final String _body;
  final DateTime _uploadTime;

  Comment(
      this._commentID, this._userID, this._body, this._uploadTime);

  int get commentID => this._commentID;

  int get userID => this._userID;

  String get body => this._body;

  DateTime get uploadTime => this._uploadTime;
}
