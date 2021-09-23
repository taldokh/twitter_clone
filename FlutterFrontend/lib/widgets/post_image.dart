import 'package:flutter/material.dart';
import '../models/image_and_text_content.dart';
import '../../api.dart';

class PostImage extends StatefulWidget {
  static const double _imageRadius = 15.0;
  final int _postImageId;

  PostImage(this._postImageId);

  @override
  _PostImageState createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> {
  NetworkImage _image;

  @override
  void initState() {
    super.initState();
    this._image = Api.postImage(this.widget._postImageId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: this._image,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(PostImage._imageRadius)),
        shape: BoxShape.rectangle,
      ),
    );
  }
}
