import 'package:FlutterFrontend/widgets/main_drawer.dart';
import 'package:FlutterFrontend/widgets/user_post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../../widgets/twitter_app_bar.dart';
import './../../models/session_state.dart';
import './../../api.dart';

class Home extends StatefulWidget {
  static const int _HamburgerIconColor = 0xFF1DA1F2;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<UserPost>> _posts;

  @override
  void initState() {
    super.initState();
    this._posts = Api.fetchHomeWallPosts(
        Provider.of<SessionState>(context, listen: false).userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: TwitterAppBarIcon(),
          iconTheme: IconThemeData(color: Color(Home._HamburgerIconColor)),
        ),
        body: Consumer<SessionState>(
          builder: (context, session, child) => FutureBuilder(
              future: this._posts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView(children: snapshot.data);
                } else {
                  return Container();
                }
              }),
        ));
  }
}
