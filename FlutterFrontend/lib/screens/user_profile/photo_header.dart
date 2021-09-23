import 'package:flutter/material.dart';
import '../../api.dart';

class PhotoHeader extends StatefulWidget {
  final int _imageId;

  PhotoHeader(this._imageId);

  @override
  _PhotoHeaderState createState() => _PhotoHeaderState();
}

class _PhotoHeaderState extends State<PhotoHeader> {
  NetworkImage _image;

  @override
  void initState() {
    super.initState();
    this._image = Api.userHeaderImage(this.widget._imageId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: DecorationImage(
          image: this._image,
          fit: BoxFit.cover,
        ),
        shape: BoxShape.rectangle,
      ),
      height: 120,
    );
  }
}
