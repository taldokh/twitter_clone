import 'content.dart';
import 'package:flutter/cupertino.dart';

// a content object type that based on a image
class ImageContent extends Content{
  final Image _image;

  ImageContent(this._image);

  Image get image => this._image;
}