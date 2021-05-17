import 'package:flutter/cupertino.dart';

// data object model that holds all the information related to a user
class User {
  final int _id;
  final String _userName;
  final String _name;
  final String _email;
  final String _bio;
  final Image _profileImage;
  final List<int> _followers;
  final List<int> _following;
  final List<int> _posts;

  User(
      this._id,
      this._userName,
      this._name,
      this._email,
      this._bio,
      this._profileImage,
      this._followers,
      this._following,
      this._posts);

  int get id => this._id;

  String get userName => this._userName;

  String get name => this._name;

  String get email => this._email;

  String get bio => this._bio;

  Image get profileImage => this._profileImage;

  List<int> get followers => this._followers;

  List<int> get following => this._following;

  List<int> get posts => this._posts;
}
