import 'package:flutter/material.dart';
import '../models/image_and_text_content.dart';

class PostImage extends StatelessWidget {
  static const double _imageRadius = 15.0;
  final ImageProvider _imageProvider;

  PostImage(this._imageProvider);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: this._imageProvider,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(_imageRadius)),
        shape: BoxShape.rectangle,
      ),
    );
  }
}
