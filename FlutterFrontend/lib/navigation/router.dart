import 'package:FlutterFrontend/screens/home/home.dart';
import 'package:FlutterFrontend/screens/user_profile/user_profile.dart';
import './../screens/log_in/log_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget screen = null;
    final Map<String, dynamic> arguments = settings.arguments;

    switch (settings.name) {
      case HomeRoute:
        screen = Home();
        break;
      case ProfileRoute:
        screen = UserProfile(arguments['userID']);
        break;
      case LogInRoute:
        screen = LogIn();
        break;
      default:
        screen = Home();
    }

    return MaterialPageRoute(builder: (BuildContext context) => screen);
  }
}
