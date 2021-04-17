import 'package:FlutterFrontend/models/post.dart';
import 'package:flutter/material.dart';

class PostText extends StatelessWidget {
  final String _text;
  static const double _HorizontalMargin = 10;

  PostText(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: _HorizontalMargin),
        child: Text(
          this._text,
          style: TextStyle(fontWeight: FontWeight.w400),
        ));
  }
}
