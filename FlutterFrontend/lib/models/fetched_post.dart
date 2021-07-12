import 'dart:collection';

import 'package:FlutterFrontend/models/content.dart';
import 'package:flutter/cupertino.dart';

// data object model that represents every post
class FetchedPost {
  final int _postID;
  final Image _userImage;
  final String _name;
  final String _handle;
  final String _uploadTime;
  final Content _content;
  final List<int> _likes;
  final int _userID;

  FetchedPost(this._postID, this._userImage, this._name, this._handle,
      this._uploadTime, this._content, this._likes, this._userID);

  int get postID => this._postID;

  Image get userImage => this._userImage;

  String get name => this._name;

  String get handle => this._handle;

  String get uploadTime => this._uploadTime;

  Content get content => this._content;

  UnmodifiableListView<int> get likes => UnmodifiableListView(this._likes);

  int get likesCount => this.likes.length;

  int get userID => this._userID;
}
