import 'package:FlutterFrontend/models/session_state.dart';
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
                    child: UserAvatar(this._fetchedPost.userImage.image))),
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
                    Container(
                        child: Row(
                      children: [
                        Consumer<SessionState>(
                          builder: (context, session, child) {
                            return Icon(
                              _didUserLiked(session.userID)
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Color(0xFF536471),
                            );
                          },
                        ),
                        Text(this._fetchedPost.likesCount)
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }

  bool _didUserLiked(int userID) {
    return this._fetchedPost.likes.contains(userID);
  }

  _onProfileTap(BuildContext context, int userID) {
    Navigator.pushNamed(context, ProfileRoute, arguments: {'userID': userID});
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
