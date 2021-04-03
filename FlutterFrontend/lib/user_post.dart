import 'package:FlutterFrontend/models/image_and_text_content.dart';
import 'package:FlutterFrontend/models/image_content.dart';
import 'package:FlutterFrontend/models/text_content.dart';
import './models/content.dart';
import 'package:flutter/material.dart';
import './models/fetched_post.dart';

class UserPost extends StatelessWidget {
  final FetchedPost _fetchedPost;

  UserPost(this._fetchedPost);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(children: [
            this._fetchedPost.userImage,
            Text(this._fetchedPost.userName),
          ]),
          contentType(this._fetchedPost.content)
        ],
      ),
    );
  }
}

Widget contentType(Content content) {
  Widget contentWidget;
  print(content.runtimeType);
  if (content.runtimeType == TextContent) {
    TextContent textContent = content;
    contentWidget = Text(textContent.text);
  } else if (content.runtimeType == ImageContent) {
    ImageContent imageContent = content;
    contentWidget = Container(
        constraints: BoxConstraints.expand(
          height: 200,
        ),
        child: imageContent.image);
  } else if (content.runtimeType == ImageAndTextContent) {
    ImageAndTextContent imageAndTextContent = content;
    contentWidget = Column(
      children: [
        Text(imageAndTextContent.text),
        Container(
            constraints: BoxConstraints.expand(
              height: 200,
            ),
            child: imageAndTextContent.image)
      ],
    );
  } else {
    print('error');
  }
  return contentWidget;
}
