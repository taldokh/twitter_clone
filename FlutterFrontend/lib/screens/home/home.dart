import 'package:FlutterFrontend/navigation/routes.dart';
import 'package:FlutterFrontend/screens/user_profile/follow_info.dart';
import 'package:FlutterFrontend/widgets/handle.dart';
import 'package:FlutterFrontend/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data.dart';
import '../../widgets/user_post.dart';
import '../../models/fetched_post.dart';
import './../../widgets/twitter_app_bar.dart';
import './../../models/session_state.dart';

class Home extends StatelessWidget {
  static const int _HamburgerIconColor = 0xFF1DA1F2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Container(
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Consumer<SessionState>(
                        builder: (context, session, child) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserAvatar(
                              _userImageById(session.userID).image,
                              avatarCircleRadius: 30,
                            ),
                            Text(
                              _userNameById(session.userID),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Handle(_userHandleById(session.userID)),
                            FollowInfo(_userFollowingById(session.userID),
                                _userFollowersById(session.userID))
                          ]);
                    })),
              )),
              Consumer<SessionState>(builder: (context, session, child) {
                return ListTile(
                  leading: Icon(Icons.account_circle_outlined),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.pushNamed(context, ProfileRoute,
                        arguments: {'userID': session.userID});
                  },
                );
              }),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TwitterAppBar(),
          iconTheme: IconThemeData(color: Color(_HamburgerIconColor)),
        ),
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

String _userFollowersById(int userId) {
  return users.firstWhere((user) => user.id == userId).followersCount;
}

String _userFollowingById(int userId) {
  return users.firstWhere((user) => user.id == userId).followingCount;
}
