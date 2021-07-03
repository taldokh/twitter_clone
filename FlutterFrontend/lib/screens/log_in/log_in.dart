import 'package:FlutterFrontend/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../../navigation/routes.dart';
import './../../models/session_state.dart';
import './../../data.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Consumer<SessionState>(builder: (context, session, child) {
            return GestureDetector(
              onTap: () {
                session.logIn(1);
                Navigator.pushReplacementNamed(context, HomeRoute);
              },
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('assets/images/photo1.jpeg').image,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  shape: BoxShape.rectangle,
                ),
              ),
            );
          }),
          Consumer<SessionState>(builder: (context, session, child) {
            return GestureDetector(
              onTap: () {
                session.logIn(2);
                Navigator.pushReplacementNamed(context, HomeRoute);
              },
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('assets/images/photo2.jpg').image,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  shape: BoxShape.rectangle,
                ),
              ),
            );
          }),
          Consumer<SessionState>(builder: (context, session, child) {
            return GestureDetector(
              onTap: () {
                session.logIn(3);
                Navigator.pushReplacementNamed(context, HomeRoute);
              },
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('assets/images/photo3.jpg').image,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  shape: BoxShape.rectangle,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
