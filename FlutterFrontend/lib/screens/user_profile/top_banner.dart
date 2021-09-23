import 'package:flutter/material.dart';
import './../user_profile/photo_header.dart';
import './../../widgets/user_avatar.dart';

class TopBanner extends StatelessWidget {
  static const double _AvatarRadius = 38;

  final int _headerImageId;
  final int _profileImageId;

  TopBanner(this._headerImageId, this._profileImageId);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, _AvatarRadius * 1.2),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PhotoHeader(this._headerImageId),
          Positioned(
            bottom: -(_AvatarRadius * 1.2),
            left: 11,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: _AvatarRadius + 3,
              child: UserAvatar(
                this._profileImageId,
                avatarCircleRadius: _AvatarRadius,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
