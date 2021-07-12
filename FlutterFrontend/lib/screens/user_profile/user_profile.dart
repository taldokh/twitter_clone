import 'package:flutter/material.dart';
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
    this._user = _fetchUser(userID);
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
            Column(children: [..._fetchPosts()])
          ],
        ),
      ),
    );
  }

  User _fetchUser(int userID) {
    return users.singleWhere((user) => user.id == userID);
  }

  List<UserPost> _fetchPosts() {
    return posts
        .where((post) => post.userId == this._user.id)
        .map((post) => UserPost(FetchedPost(
            post.postId,
            _userImageById(post.userId),
            _userNameById(post.userId),
            _userHandleById(post.userId),
            post.uploadTime,
            post.content,
            post.likes,
            post.userId)))
        .toList();
  }

  Image _userImageById(int userId) {
    return users.firstWhere((user) => user.id == userId).photo;
  }

  String _userHandleById(int userId) {
    return users.firstWhere((user) => user.id == userId).handle;
  }

  String _userNameById(int userId) {
    return users.firstWhere((user) => user.id == userId).name;
  }
}
