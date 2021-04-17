import 'package:FlutterFrontend/models/post.dart';
import 'package:flutter/material.dart';

class PostText extends StatelessWidget {
  final String _text;

  PostText(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10), child: Text(this._text));
  }
}
