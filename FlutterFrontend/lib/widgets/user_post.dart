import 'package:FlutterFrontend/models/image_and_text_content.dart';
import 'package:FlutterFrontend/models/image_content.dart';
import 'package:FlutterFrontend/models/text_content.dart';
import '../models/content.dart';
import 'package:flutter/material.dart';
import '../models/fetched_post.dart';
import './post_text.dart';
import './user_avatar.dart';

// a widget that determines
class UserPost extends StatelessWidget {
  final FetchedPost _fetchedPost;
  static const double _PostVerticalMargin = 10;
  static const double _ContentVerticalMargin = 5;

  UserPost(this._fetchedPost);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: _PostVerticalMargin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(this._fetchedPost.userImage.image),
          Flexible(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text(
                    this._fetchedPost.userName,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  Container(child: contentType(this._fetchedPost.content))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// returns a widget based on the post content type.
// by comparing the runtimetype of the content object with the exact content classes
Widget contentType(Content content) {
  Widget contentWidget;
  if (content.runtimeType == TextContent) {
    TextContent textContent = content;
    contentWidget = PostText(textContent.text);
  } else if (content.runtimeType == ImageContent) {
    ImageContent imageContent = content;
    contentWidget = Container(
      height: 200.0,
      width: 400.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageContent.image.image,
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
      ),
    );
  } else if (content.runtimeType == ImageAndTextContent) {
    ImageAndTextContent imageAndTextContent = content;
    contentWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostText(imageAndTextContent.text),
        Container(
          height: 200.0,
          width: 400.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageAndTextContent.image.image,
              fit: BoxFit.fill,
            ),
            shape: BoxShape.rectangle,
          ),
        )
      ],
    );
  } else {}
  return contentWidget;
}
