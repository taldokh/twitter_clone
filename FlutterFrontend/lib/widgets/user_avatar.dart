import 'package:FlutterFrontend/models/post.dart';
import 'package:flutter/material.dart';
import '../../api.dart';

class UserAvatar extends StatelessWidget {
  final int _image;
  double _avatarCircleRadius;

  static const double _HorizontalMargin = 10;

  UserAvatar(int this._image,
      {double avatarCircleRadius = 25}) {
    this._avatarCircleRadius = avatarCircleRadius;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: this._avatarCircleRadius, backgroundImage: Api.userProfileImage(this._image));
  }
}
