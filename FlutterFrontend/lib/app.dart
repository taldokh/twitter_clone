import 'package:flutter/material.dart';
import './screens/home/home.dart';
import './screens/user_profile/user_profile.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}
