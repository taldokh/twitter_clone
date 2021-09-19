import 'package:flutter/material.dart';
import '../models/image_and_text_content.dart';
import '../../api.dart';

class PostImage extends StatelessWidget {
  static const double _imageRadius = 15.0;
  final int _postImageId;

  PostImage(this._postImageId);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Api.postImage(this._postImageId),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(_imageRadius)),
        shape: BoxShape.rectangle,
      ),
    );
  }
}
