import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import './models/session_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SessionState(),
      child: App(),
    ),
  );
}
