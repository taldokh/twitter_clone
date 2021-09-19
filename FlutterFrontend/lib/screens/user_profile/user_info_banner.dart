import 'package:flutter/material.dart';
import './../../widgets/handle.dart';
import './follow_info.dart';

class UserInfoBanner extends StatelessWidget {
  final String _name;
  final String _handle;
  final String _joinDate;
  final int _followingCount;
  final int _followersCount;

  UserInfoBanner(this._name, this._handle, this._joinDate, this._followingCount,
      this._followersCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.fromLTRB(11, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this._name,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                Handle(this._handle)
              ],
            ),
          ),
          Text("Joined " + this._joinDate),
          FollowInfo(this._followingCount, this._followersCount)
        ],
      ),
    );
  }
}
