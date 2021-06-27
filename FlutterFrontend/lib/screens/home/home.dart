import 'package:flutter/material.dart';
import '../../data.dart';
import '../../widgets/user_post.dart';
import '../../models/fetched_post.dart';
import './../../widgets/twitter_app_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: TwitterAppBar()),
      body: ListView(children: [..._fetchPosts()]),
    );
  }
}

List<UserPost> _fetchPosts() {
  return posts
      .map((post) => UserPost(
            FetchedPost(
                _userImageById(post.userId),
                _userNameById(post.userId),
                _userHandleById(post.userId),
                post.uploadTime,
                post.content,
                post.userId),
          ))
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
