import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:FlutterFrontend/models/image_and_text_content.dart';
import 'package:FlutterFrontend/models/image_content.dart';
import 'package:FlutterFrontend/models/text_content.dart';
import '../models/content.dart';
import '../models/fetched_post.dart';
import './post_text.dart';
import './user_avatar.dart';
import './post_image.dart';
import './post_header.dart';

// a widget that determines
class UserPost extends StatelessWidget {
  final FetchedPost _fetchedPost;
  static const double _PostVerticalMargin = 11;
  static const double _AvatarRightPadding = 11;

  UserPost(this._fetchedPost);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Divider(),
      Container(
        margin: EdgeInsets.all(_PostVerticalMargin),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(right: _AvatarRightPadding),
                child: UserAvatar(this._fetchedPost.userImage.image)),
            Flexible(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostHeader(this._fetchedPost.name, this._fetchedPost.handle,
                        this._fetchedPost.uploadTime),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: this._contentType(this._fetchedPost.content))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }

  // returns a widget based on the post content type.
// by comparing the runtimetype of the content object with the exact content classes
  Widget _contentType(Content content) {
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
}
