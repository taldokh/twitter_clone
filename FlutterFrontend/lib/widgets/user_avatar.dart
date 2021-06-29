import 'package:FlutterFrontend/models/post.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final ImageProvider _imageProvider;
  double _avatarCircleRadius;

  static const double _HorizontalMargin = 10;

  UserAvatar(ImageProvider this._imageProvider,
      {double avatarCircleRadius = 25}) {
    this._avatarCircleRadius = avatarCircleRadius;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: this._avatarCircleRadius, backgroundImage: this._imageProvider);
  }
}
