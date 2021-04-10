import 'package:flutter/material.dart';
import 'widgets/user_post.dart';
import './data.dart';
import './models/fetched_post.dart';
import './screens/home.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}
