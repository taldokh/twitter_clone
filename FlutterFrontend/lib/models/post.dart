import 'content.dart';

// data object model that holds all the information related to a post
class Post {
  final int _postId;
  final int userId;
  final Content content;
  final List<int> _likes;
  final DateTime _uploadTime;

  Post(this._postId, this.userId, this.content, this._likes, this._uploadTime);
}