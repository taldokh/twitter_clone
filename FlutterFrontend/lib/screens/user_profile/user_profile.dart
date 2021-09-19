import 'package:FlutterFrontend/models/fetched_user.dart';
import 'package:flutter/material.dart';
import '../../api.dart';
import '../../data.dart';
import '../../widgets/user_post.dart';
import '../../models/fetched_post.dart';
import '../../models/user.dart';
import './../../widgets/user_avatar.dart';
import './../../widgets/handle.dart';
import './photo_header.dart';
import './top_banner.dart';
import './user_info_banner.dart';
import './../../widgets/twitter_app_bar.dart';

class UserProfile extends StatelessWidget {
  static const double _AvatarRadius = 38;
  int _userID;
  UserProfile(this._userID);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Api.fetchUser(this._userID),
        builder: (context, snapshot) {
          final FetchedUser fetchedUser = snapshot.data;
          return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                title: TwitterAppBarIcon()),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBanner(
                      fetchedUser.headerImageId, fetchedUser.profileImageId),
                  UserInfoBanner(
                      fetchedUser.name,
                      fetchedUser.handle,
                      fetchedUser.joinDate,
                      fetchedUser.followingCount,
                      fetchedUser.followersCount),
                  FutureBuilder(
                      future: Api.fetchProfilePageWallPosts(fetchedUser.id),
                      builder: (context, snapshot) =>
                          Column(children: [...snapshot.data]))
                ],
              ),
            ),
          );
        });
  }
}
