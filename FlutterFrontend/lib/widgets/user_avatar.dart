import 'package:FlutterFrontend/models/post.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final ImageProvider _imageProvider;
  static const double _HorizontalMargin = 10;
  static const double _AvatarCircleBorderRadius = 26;
  static const double _AvatarCircleRadius = 25;

  UserAvatar(this._imageProvider);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _HorizontalMargin),
      child: CircleAvatar(
        radius: _AvatarCircleBorderRadius,
        backgroundColor: Colors.black,
        child: CircleAvatar(radius: _AvatarCircleRadius, backgroundImage: this._imageProvider),
      ),
    );
  }
}
