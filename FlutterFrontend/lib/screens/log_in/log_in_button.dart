import 'package:FlutterFrontend/models/log_in_form_validation_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LogInFormValidationState>(
      builder: (context, form, _) => Align(
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
            onPressed: form.isFormValid ? () {} : null,
            child: Text(
              'Log in',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
