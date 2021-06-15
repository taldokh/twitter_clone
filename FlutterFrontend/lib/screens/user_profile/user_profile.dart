import 'package:flutter/material.dart';
import '../../data.dart';
import '../../widgets/user_post.dart';
import '../../models/fetched_post.dart';
import '../../models/user.dart';

class UserProfile extends StatelessWidget {
  User _user;
  UserProfile(int userID) {
    this._user = _fetchUser(userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: this._user.profileImage.image,
                ),
              ),
              Text(this._user.bio),
              Column(children: [..._fetchPosts()])
            ],
          ),
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
