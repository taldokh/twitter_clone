import 'dart:collection';

import 'package:FlutterFrontend/models/content.dart';
import 'package:FlutterFrontend/models/content_factory.dart';
import 'package:flutter/cupertino.dart';

// data object model that represents every post
class FetchedPost {
  final int _postID;
  final String _name;
  final String _handle;
  final String _uploadTime;
  final Content _content;
  final int _likesCount;
  final int _commentsCount;
  final int _userID;
  final bool _didLike;

  FetchedPost(this._postID, this._name, this._handle,
      this._uploadTime, this._content, this._likesCount, this._commentsCount, this._userID, this._didLike);

    factory FetchedPost.fromJson(Map<String, dynamic> json) {
    return FetchedPost(
      json['_id'],
      json['name'],
      json['handle'],
      json['uploadTime'],
      ContentFactory.getContent(json['content']),
      json['likesCount'],
      json['commentsCount'],
      json['userId'],
      json['didLike']
    );
  }

  int get postID => this._postID;

  String get name => this._name;

  String get handle => this._handle;

  String get uploadTime => this._uploadTime;

  Content get content => this._content;

  int get likesCount => this._likesCount;

  int get commentsCount => this._commentsCount;

  int get userID => this._userID;

  bool get didLike => this._didLike;
}
