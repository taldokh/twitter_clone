import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './handle.dart';
import './../navigation/routes.dart';

class PostHeader extends StatelessWidget {
  final String _name;
  final String _handle;
  final String _uploadTime;
  final int _userID;
  static const String _AtSymbol = '@';
  static const int _HandleCOlor = 0xFF5B7083;
  static const int _UploadTimeCOlor = 0xFF5B7083;
  static const String _UploadTimeSeperator = ' · ';

  PostHeader(this._name, this._handle, this._uploadTime, this._userID);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(
              this._name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(' '),
            Handle(this._handle),
          ]),
        ),
        Text(_UploadTimeSeperator),
        Text(
          this._uploadTime,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Color(_UploadTimeCOlor)),
        ),
      ],
    );
  }
}
