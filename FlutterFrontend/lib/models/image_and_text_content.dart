import 'text_content.dart';
import 'package:flutter/material.dart';

// a content object type that based on a text and an image
class ImageAndTextContent extends TextContent {
  final Image _image;

  ImageAndTextContent(this._image, String text) : super(text);

  Image get image => this._image;
}
