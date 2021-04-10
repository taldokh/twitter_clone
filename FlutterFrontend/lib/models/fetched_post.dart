import 'package:FlutterFrontend/models/content.dart';
import 'package:flutter/cupertino.dart';

// data object model that represents every post
class FetchedPost {
  final Image userImage;
  final String userName;
  final Content content;

  FetchedPost(this.userImage, this.userName, this.content);
}
