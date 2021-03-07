import 'Content.dart';

class Post {
  final int _postID;
  final int _userID;
  final Content _content;
  final List<int> _likes;
  final DateTime _uploadTime;

  Post(this._postID, this._userID, this._content, this._likes, this._uploadTime);
}