import 'package:flutter/material.dart';

class TwitterAppBar extends StatelessWidget {
  static const _AppBarHeight = 35.0;

  TwitterAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/twitterLogo.jpg',
          fit: BoxFit.cover,
          height: _AppBarHeight,
        ),
      ],
    );
  }
}
