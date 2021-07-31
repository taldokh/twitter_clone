import 'package:flutter/material.dart';

class TwitterAppBarIcon extends StatelessWidget {
  static const _AppBarHeight = 35.0;

  TwitterAppBarIcon();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/twitterLogo.jpg',
      fit: BoxFit.cover,
      height: _AppBarHeight,
    );
  }
}
