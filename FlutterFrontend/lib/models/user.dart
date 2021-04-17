import 'package:flutter/cupertino.dart';

// data object model that holds all the information related to a user
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

  User(
      this._id,
      this._userName,
      this._firstName,
      this._lastName,
      this._email,
      this._about,
      this._imagePath,
      this._followers,
      this._following,
      this._posts);

  int get id => this._id;

  String get userName => this._userName;

  String get firstName => this._firstName;

  String get lastName => this._lastName;

  String get email => this._email;

  String get about => this._about;

  Image get imagePath => this._imagePath;

  List<int> get followers => this._followers;

  List<int> get following => this._following;

  List<int> get posts => this._posts;
}
