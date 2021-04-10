import 'package:FlutterFrontend/models/content.dart';
import 'package:flutter/cupertino.dart';

// data object model that represents every post
class FetchedPost {
  final Image _userImage;
  final String _userName;
  final Content _content;

  FetchedPost(this._userImage, this._userName, this._content);

  Image get userImage => this._userImage;

  String get userName => this._userName;

  Content get content => this._content;
}
