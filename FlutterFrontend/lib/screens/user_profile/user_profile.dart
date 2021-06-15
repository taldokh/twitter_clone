import 'package:flutter/material.dart';
import '../../data.dart';
import '../../widgets/user_post.dart';
import '../../models/fetched_post.dart';
import '../../models/user.dart';
import './../../widgets/user_avatar.dart';

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
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/twitterLogo.jpg',
              fit: BoxFit.cover,
              height: 35.0,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: Colors.blue,
                  height: 120,
                ),
                Positioned(
                  bottom: -(_AvatarRadius * 1.2),
                  left: 11,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: _AvatarRadius + 3,
                    child: UserAvatar(
                      this._user.profileImage.image,
                      avatarCircleRadius: _AvatarRadius,
                    ),
                  ),
                ),
              ],
            ),
            Text(this._user.bio),
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
            _userImageById(post.userId),
            _userNameById(post.userId),
            _userHandleById(post.userId),
            post.uploadTime,
            post.content)))
        .toList();
  }

  Image _userImageById(int userId) {
    return users.firstWhere((user) => user.id == userId).profileImage;
  }

  String _userHandleById(int userId) {
    return users.firstWhere((user) => user.id == userId).handle;
  }

  String _userNameById(int userId) {
    return users.firstWhere((user) => user.id == userId).name;
  }
}
