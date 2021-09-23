import 'package:FlutterFrontend/models/log_in_form_validation_state.dart';
import 'package:FlutterFrontend/models/session_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../../api.dart';
import '../../navigation/routes.dart';

class LogInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LogInFormValidationState>(
      builder: (context, form, _) => Consumer<SessionState>(
        builder: (context, session, _) => Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                  splashFactory: NoSplash.splashFactory),
              onPressed: form.isFormValid
                  ? () async {
                      session.logIn(await Api.autenticate(
                          form.userField, form.passwordField));
                      Navigator.pushReplacementNamed(context, HomeRoute);
                    }
                  : null,
              child: Text(
                'Log in',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
