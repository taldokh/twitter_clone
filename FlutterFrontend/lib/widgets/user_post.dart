import 'package:FlutterFrontend/models/session_state.dart';
import 'package:FlutterFrontend/widgets/post_action_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:FlutterFrontend/models/image_and_text_content.dart';
import 'package:FlutterFrontend/models/image_content.dart';
import 'package:FlutterFrontend/models/text_content.dart';
import 'package:provider/provider.dart';
import '../models/content.dart';
import '../models/fetched_post.dart';
import './post_text.dart';
import './user_avatar.dart';
import './post_image.dart';
import './post_header.dart';
import '../navigation/routes.dart';

// a widget that determines
class UserPost extends StatelessWidget {
  final FetchedPost _fetchedPost;
  static const double _PostMargin = 11;
  static const double _AvatarRightPadding = 11;

  UserPost(this._fetchedPost);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Divider(),
      Container(
        margin: EdgeInsets.all(_PostMargin),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(right: _AvatarRightPadding),
                child: GestureDetector(
                    onTap: () =>
                        _onProfileTap(context, this._fetchedPost.userID),
                    child: UserAvatar(this._fetchedPost.userID))),
            Flexible(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: PostHeader(
                          this._fetchedPost.name,
                          this._fetchedPost.handle,
                          this._fetchedPost.uploadTime,
                          this._fetchedPost.userID),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: this._contentType(this._fetchedPost.content)),
                    PostActionBar(this._fetchedPost.likesCount, this._fetchedPost.didLike, this._fetchedPost.postID)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }

  _onProfileTap(BuildContext context, int userID) {
    Navigator.pushNamed(context, ProfileRoute, arguments: {'userID': userID});
  }

  // returns a widget based on the post content type.
// by comparing the runtimetype of the content object with the exact content classes
  Widget _contentType(Object content) {
    Widget contentWidget;
    if (content.runtimeType == TextContent) {
      TextContent textContent = content;
      contentWidget = PostText(textContent.text);
    } else if (content.runtimeType == ImageContent) {
      ImageContent imageContent = content;
      contentWidget = PostImage(imageContent.image);
    } else if (content.runtimeType == ImageAndTextContent) {
      ImageAndTextContent imageAndTextContent = content;
      contentWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 5),
              child: PostText(imageAndTextContent.text)),
          PostImage(imageAndTextContent.image)
        ],
      );
    } else {}
    return contentWidget;
  }
}
