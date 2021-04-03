import 'package:flutter/cupertino.dart';

class User {
  final int id;
  final String userName;
  final String _firstName;
  final String _lastName;
  final String _email;
  final String _about;
  final Image imagePath;
  final List<int> _followers;
  final List<int> _following;
  final List<int> _posts;

  User(this.id, this.userName, this._firstName, this._lastName, this._email, this._about, this.imagePath, this._followers, this._following, this._posts);
}

