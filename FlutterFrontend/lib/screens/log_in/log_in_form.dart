import 'dart:developer';

import 'package:FlutterFrontend/models/log_in_form_validation_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LogInFormValidationState>(
      builder: (context, form, _) => Column(
        children: [
          TextField(
            onChanged: (val) => form.userFieldLength = val.length,
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Email or username',
                labelStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5B7083)),
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          Divider(),
          TextField(
            enableSuggestions: false,
            autocorrect: false,
            obscureText: true,
            onChanged: (val) => form.passwordFieldLength = val.length,
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Password',
                labelStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5B7083)),
                floatingLabelBehavior: FloatingLabelBehavior.always),
          )
        ],
      ),
    );
  }
}
