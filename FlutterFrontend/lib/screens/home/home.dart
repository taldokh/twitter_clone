import 'package:flutter/material.dart';
import '../../data.dart';
import '../../widgets/user_post.dart';
import '../../models/fetched_post.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(child: Column(children: [..._fetchPosts()])),
    );
  }
}

List<UserPost> _fetchPosts() {
  return posts
      .map((post) => UserPost(FetchedPost(_userImageById(post.userId),
          _userNameById(post.userId), post.content)))
      .toList();
}

Image _userImageById(int userId) {
  return users.firstWhere((user) => user.id == userId).profileImage;
}

String _userNameById(int userId) {
  return users.firstWhere((user) => user.id == userId).userName;
}
