import 'dart:developer';

import 'package:FlutterFrontend/models/session_state.dart';
import 'package:FlutterFrontend/navigation/routes.dart';
import 'package:FlutterFrontend/screens/user_profile/follow_info.dart';
import 'package:FlutterFrontend/widgets/handle.dart';
import 'package:FlutterFrontend/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../data.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<SessionState>(
        builder: (context, session, child) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => _onProfileTap(context, session.userID),
                          child: UserAvatar(
                            _userImageById(session.userID).image,
                            avatarCircleRadius: 30,
                          ),
                        ),
                        Text(
                          _userNameById(session.userID),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Handle(_userHandleById(session.userID)),
                        FollowInfo(_userFollowingById(session.userID),
                            _userFollowersById(session.userID))
                      ]),
                ),
              )),
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text('Profile'),
                onTap: () => _onProfileTap(context, session.userID),
              ),
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text('Log Out'),
                onTap: () => _onLogOutTap(context, session),
              ),
            ],
          );
        },
      ),
    );
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

  _onProfileTap(BuildContext context, int userID) {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, ProfileRoute, arguments: {'userID': userID});
  }

  _onLogOutTap(BuildContext context, SessionState session) {
    Navigator.of(context).pop();
    session.logOut();
    Navigator.pushReplacementNamed(context, LogInRoute);
  }
}
