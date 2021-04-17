import 'package:FlutterFrontend/models/post.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final ImageProvider _imageProvider;

  UserAvatar(this._imageProvider);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        radius: 25,
        backgroundImage: this._imageProvider,
      ),
    );
  }
}
