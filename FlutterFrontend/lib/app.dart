import 'package:FlutterFrontend/navigation/Router.dart';
import 'package:FlutterFrontend/screens/log_in/log_in.dart';
import 'package:flutter/material.dart';
import './screens/home/home.dart';
import './screens/user_profile/user_profile.dart';
import './navigation/router.dart' as myRouter;
import './navigation/routes.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: myRouter.Router.generateRoute,
      initialRoute: LogInRoute,
    );
  }
}
