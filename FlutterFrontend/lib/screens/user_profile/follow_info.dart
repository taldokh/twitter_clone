import 'package:flutter/material.dart';
import './sub_follow_info.dart';

class FollowInfo extends StatelessWidget {
  final int _followingCount;
  final int _followersCount;

  FollowInfo(this._followingCount, this._followersCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SubFollowInfo(false, this._followingCount),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 11),
            child: SubFollowInfo(true, this._followersCount)),
      ],
    );
  }
}
