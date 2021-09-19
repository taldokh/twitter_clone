import 'package:flutter/material.dart';
import '../../api.dart';

class PhotoHeader extends StatelessWidget {
  final int _imageId;

  PhotoHeader(this._imageId);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: DecorationImage(
          image: Api.userHeaderImage(this._imageId),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.rectangle,
      ),
      height: 120,
    );
  }
}
