import 'package:FlutterFrontend/models/fetched_user.dart';
import 'package:flutter/material.dart';
import '../../api.dart';
import '../../widgets/user_post.dart';
import './top_banner.dart';
import './user_info_banner.dart';
import './../../widgets/twitter_app_bar.dart';

class UserProfile extends StatefulWidget {
  final int _userID;
  UserProfile(this._userID);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Future<FetchedUser> _details;
  Future<List<UserPost>> _posts;

  @override
  void initState() {
    super.initState();
    this._details = Api.fetchUser(this.widget._userID);
    this._posts = Api.fetchProfilePageWallPosts(widget._userID);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: this._details,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final FetchedUser fetchedUser = snapshot.data;
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
                    TopBanner(
                        fetchedUser.headerImageId, fetchedUser.profileImageId),
                    UserInfoBanner(
                        fetchedUser.name,
                        fetchedUser.handle,
                        fetchedUser.joinDate,
                        fetchedUser.followingCount,
                        fetchedUser.followersCount),
                    FutureBuilder(
                        future: this._posts,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Column(children: [...snapshot.data]);
                          } else {
                            return Container();
                          }
                        })
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
