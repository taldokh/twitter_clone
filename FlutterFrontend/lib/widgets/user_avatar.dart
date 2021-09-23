import 'package:FlutterFrontend/models/post.dart';
import 'package:flutter/material.dart';
import '../../api.dart';

class UserAvatar extends StatefulWidget {
  final int _image;
  double _avatarCircleRadius;

  static const double _HorizontalMargin = 10;

  UserAvatar(int this._image, {double avatarCircleRadius = 25}) {
    this._avatarCircleRadius = avatarCircleRadius;
  }

  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  NetworkImage _image;

  @override
  void initState() {
    super.initState();
    this._image = Api.userProfileImage(this.widget._image);
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: this.widget._avatarCircleRadius, backgroundImage: this._image);
  }
}
