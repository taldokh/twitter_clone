import 'package:flutter/material.dart';
import '../../data.dart';
import '../../widgets/user_post.dart';
import '../../models/fetched_post.dart';
import '../../models/user.dart';

class UserProfile extends StatelessWidget {
  User _user;
  UserProfile(int userID) {
    this._user = _fetchUser(userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: this._user.imagePath.image,
            )
          ],
        ),
      ),
    );
  }

  User _fetchUser(int userID) {
    return users.singleWhere((user) => user.id == userID);
  }
}
