import 'package:FlutterFrontend/models/log_in_form_validation_state.dart';
import 'package:FlutterFrontend/screens/home/home.dart';
import 'package:FlutterFrontend/screens/log_in/log_in_button.dart';
import 'package:FlutterFrontend/screens/log_in/log_in_form.dart';
import 'package:FlutterFrontend/widgets/twitter_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../../navigation/routes.dart';
import './../../models/session_state.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: TwitterAppBarIcon(),
      ),
      body: ChangeNotifierProvider(
        create: (context) => LogInFormValidationState(),
        child: FooterLayout(
          footer: KeyboardAttachable(child: LogInButton()),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Log in to Twitter.',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )),
                LogInForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
