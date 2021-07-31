import 'package:FlutterFrontend/navigation/routes.dart';
import 'package:FlutterFrontend/screens/user_profile/follow_info.dart';
import 'package:FlutterFrontend/widgets/handle.dart';
import 'package:FlutterFrontend/widgets/main_drawer.dart';
import 'package:FlutterFrontend/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data.dart';
import '../../widgets/user_post.dart';
import '../../models/fetched_post.dart';
import './../../widgets/twitter_app_bar.dart';
import './../../models/session_state.dart';
import './../../api.dart';

class Home extends StatelessWidget {
  static const int _HamburgerIconColor = 0xFF1DA1F2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: TwitterAppBarIcon(),
          iconTheme: IconThemeData(color: Color(_HamburgerIconColor)),
        ),
        body: Consumer<SessionState>(
          builder: (context, session, child) {
            return ListView(children: [...Api.fetchHomeWallPosts(session.userID)]);
          },
        ));
  }
}
