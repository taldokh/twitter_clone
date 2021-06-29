import 'package:flutter/material.dart';

class PhotoHeader extends StatelessWidget {
  final ImageProvider _photo;

  PhotoHeader(this._photo);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: DecorationImage(
          image: this._photo,
          fit: BoxFit.cover,
        ),
        shape: BoxShape.rectangle,
      ),
      height: 120,
    );
  }
}
