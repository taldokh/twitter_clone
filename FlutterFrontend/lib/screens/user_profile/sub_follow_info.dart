import 'package:flutter/material.dart';

class SubFollowInfo extends StatelessWidget {
  static const _Following = ' Following';
  static const _Followers = ' Followers';

  final bool _followers;
  final int _count;

  SubFollowInfo(this._followers, this._count);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: this._count.toString(),
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: this._followers ? _Followers : _Following),
          ],
        ),
      ),
    );
  }
}
