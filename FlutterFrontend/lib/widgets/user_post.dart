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

  UserPost(this._fetchedPost);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(children: [
            UserAvatar(this._fetchedPost.userImage.image),
            Container(
                child: Text(
              this._fetchedPost.userName,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ]),
          contentType(this._fetchedPost.content)
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
        child: FittedBox(child: imageContent.image, fit: BoxFit.fill));
  } else if (content.runtimeType == ImageAndTextContent) {
    ImageAndTextContent imageAndTextContent = content;
    contentWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostText(imageAndTextContent.text),
        Container(child: imageAndTextContent.image)
      ],
    );
  } else {}
  return contentWidget;
}
