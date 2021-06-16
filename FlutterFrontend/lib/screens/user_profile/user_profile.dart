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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, _AvatarRadius * 1.2),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: DecorationImage(
                        image: this._user.headerPhoto.image,
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    height: 120,
                  ),
                  Positioned(
                    bottom: -(_AvatarRadius * 1.2),
                    left: 11,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: _AvatarRadius + 3,
                      child: UserAvatar(
                        this._user.photo.image,
                        avatarCircleRadius: _AvatarRadius,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              margin: EdgeInsets.fromLTRB(11, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this._user.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                        Text('@' + this._user.handle,
                            style: TextStyle(color: Color(0xFF5B7083))),
                      ],
                    ),
                  ),
                  Text("Joined " + this._user.joinDate),
                  Row(
                    children: [
                      Container(
                          child: Text(this._user.followingCount.toString() +
                              " Following")),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 11),
                          child: Text(this._user.followersCount.toString() +
                              " Followers"))
                    ],
                  )
                ],
              ),
            ),
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
    return users.firstWhere((user) => user.id == userId).photo;
  }

  String _userHandleById(int userId) {
    return users.firstWhere((user) => user.id == userId).handle;
  }

  String _userNameById(int userId) {
    return users.firstWhere((user) => user.id == userId).name;
  }
}
