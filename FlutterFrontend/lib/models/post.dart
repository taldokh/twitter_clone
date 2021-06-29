import 'content.dart';
import 'comment.dart';
// data object model that holds all the information related to a post
class Post {
  final int _postId;
  final int _userId;
  final Content _content;
  final List<int> _likes;
  final List<Comment> _comments;
  final String _uploadTime;

  Post(
      this._postId, this._userId, this._content, this._likes, this._comments, this._uploadTime);

  int get postId => this._postId;

  int get userId => this._userId;

  Content get content => this._content;

  List<int> get likes => this._likes;

  List<Comment> get comments => this._comments;

  String get uploadTime => this._uploadTime;
}
