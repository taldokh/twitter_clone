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
  User _user;
  UserProfile(int userID) {
    this._user = Api.fetchUser(userID);
  }

  @override
  Widget build(BuildContext context) {
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
            TopBanner(this._user.headerPhoto.image, this._user.photo.image),
            UserInfoBanner(
                this._user.name,
                this._user.handle,
                this._user.joinDate,
                this._user.followingCount,
                this._user.followersCount),
            Column(children: [...Api.fetchProfilePageWallPosts(this._user.id)])
          ],
        ),
      ),
    );
  }
}
