import 'package:flutter/material.dart';
import '../data.dart';
import '../user_post.dart';
import '../models/fetched_post.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(child: Column(children: [...fetchPosts()])),
    );
  }
}

List<UserPost> fetchPosts() {
  return posts
      .map((post) => UserPost(FetchedPost(
          userImageById(post.userId), userNameById(post.userId), post.content)))
      .toList();
}

Image userImageById(int userId) {
  return users.firstWhere((user) => user.id == userId).imagePath;
}

String userNameById(int userId) {
  return users.firstWhere((user) => user.id == userId).userName;
}
