import 'TextContent.dart';
import 'package:flutter/material.dart';

class ImageAndTextContent extends TextContent{
  final Image _image;

  ImageAndTextContent(this._image, String text) : super(text);
}