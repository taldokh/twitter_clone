import 'package:FlutterFrontend/models/image_and_text_content.dart';
import 'package:FlutterFrontend/models/image_content.dart';
import 'package:FlutterFrontend/models/text_content.dart';
import '../models/content.dart';
import 'package:flutter/material.dart';
import '../models/fetched_post.dart';
import './post_text.dart';
import './user_avatar.dart';
import './post_image.dart';

// a widget that determines
class UserPost extends StatelessWidget {
  final FetchedPost _fetchedPost;
  static const double _PostVerticalMargin = 10;
  static const double _ContentVerticalMargin = 5;

  UserPost(this._fetchedPost);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(_PostVerticalMargin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(this._fetchedPost.userImage.image),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text(
                    this._fetchedPost.userName,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: contentType(this._fetchedPost.content))
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
    contentWidget = PostImage(imageContent.image.image);
  } else if (content.runtimeType == ImageAndTextContent) {
    ImageAndTextContent imageAndTextContent = content;
    contentWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 5),
            child: PostText(imageAndTextContent.text)),
        PostImage(imageAndTextContent.image.image)
      ],
    );
  } else {}
  return contentWidget;
}
