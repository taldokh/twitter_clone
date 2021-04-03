import 'package:flutter/material.dart';
import './user_post.dart';
import './data.dart';
import './models/fetched_post.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: SingleChildScrollView(child: Column(children: [...fetchPosts()])),
      ),
    );
  }
}

List<UserPost> fetchPosts() {
  print(posts.last.content.runtimeType.hashCode);
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
