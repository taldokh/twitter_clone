import 'package:FlutterFrontend/models/content.dart';
import 'package:flutter/cupertino.dart';

// data object model that represents every post
class FetchedPost {
  final Image _userImage;
  final String _name;
  final String _handle;
  final String _uploadTime;
  final Content _content;
  final int _userID;

  FetchedPost(this._userImage, this._name, this._handle, this._uploadTime,
      this._content, this._userID);

  Image get userImage => this._userImage;

  String get name => this._name;

  String get handle => this._handle;

  String get uploadTime => this._uploadTime;

  Content get content => this._content;

  int get userID => this._userID;
}
