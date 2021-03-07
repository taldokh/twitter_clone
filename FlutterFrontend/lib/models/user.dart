import 'package:flutter/cupertino.dart';

class User {
  final int _id;
  final String _userName;
  final String _firstName;
  final String _lastName;
  final String _email;
  final String _about;
  final Image _imagePath;
  final List<int> _followers;
  final List<int> _following;
  final List<int> _posts;

  User(this._id, this._userName, this._firstName, this._lastName, this._email, this._about, this._imagePath, this._followers, this._following, this._posts);
}

