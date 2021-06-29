import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data.dart';
import '../../widgets/user_post.dart';
import '../../models/fetched_post.dart';
import './../../widgets/twitter_app_bar.dart';
import './../../models/session_state.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, title: TwitterAppBar()),
        body: Consumer<SessionState>(
          builder: (context, session, child) {
            return ListView(children: [..._fetchHomeWallPosts(session.userID)]);
          },
        ));
  }
}

List<UserPost> _fetchHomeWallPosts(int id) {
  List<int> followingUsersIDs =
      users.firstWhere((user) => user.id == id).following;

  List<int> followingUsersPostsIDs = users
      .where((user) => followingUsersIDs.contains(user.id))
      .map((user) => user.posts)
      .expand((postsIDs) => postsIDs)
      .toList();

  return posts
      .where((post) => followingUsersPostsIDs.contains(post.postId))
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
