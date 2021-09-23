import 'dart:developer';

import 'package:FlutterFrontend/models/fetched_drawer.dart';
import 'package:FlutterFrontend/models/session_state.dart';
import 'package:FlutterFrontend/navigation/routes.dart';
import 'package:FlutterFrontend/screens/user_profile/follow_info.dart';
import 'package:FlutterFrontend/widgets/handle.dart';
import 'package:FlutterFrontend/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Future<FetchedDrawer> _details;

  @override
  void initState() {
    super.initState();
    this._details = Api.drawerDetails(
            Provider.of<SessionState>(context, listen: false).userID);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: this._details,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            FetchedDrawer fetchedDrawer = snapshot.data;
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
                                  onTap: () =>
                                      _onProfileTap(context, session.userID),
                                  child: UserAvatar(
                                    session.userID,
                                    avatarCircleRadius: 30,
                                  ),
                                ),
                                Text(
                                  fetchedDrawer.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Handle(fetchedDrawer.handle),
                                FollowInfo(
                                  fetchedDrawer.followingCount,
                                  fetchedDrawer.followersCount,
                                )
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
          } else {
            return Container();
          }
        });
  }

  _onProfileTap(BuildContext context, int userID) {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, ProfileRoute, arguments: {'userID': userID});
  }

  _onLogOutTap(BuildContext context, SessionState session) async {
    Navigator.of(context).pop();
    session.logOut();
    Navigator.pushReplacementNamed(context, LogInRoute);
  }
}
