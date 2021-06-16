import 'package:flutter/material.dart';

class Handle extends StatelessWidget {
  static const _HandleSymbol = '@';
  static const int _HandleCOlor = 0xFF5B7083;

  final String _handleName;

  Handle(this._handleName);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        _HandleSymbol + this._handleName,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Color(_HandleCOlor)),
      ),
    );
  }
}
