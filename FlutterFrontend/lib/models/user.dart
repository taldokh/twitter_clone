import 'package:flutter/cupertino.dart';

// data object model that holds all the information related to a user
class User {
  final int _id;
  final String _password;
  final String _name;
  final String _handle;
  final String _email;
  final String _bio;
  final int _profileImageId;
  final int _headerImageId;
  final List<int> _followers;
  final List<int> _following;
  final List<int> _posts;
  final String _joinDate;
  final String _followersCount;
  final String _followingCount;

  User(
      this._id,
      this._password,
      this._name,
      this._handle,
      this._email,
      this._bio,
      this._profileImageId,
      this._headerImageId,
      this._followers,
      this._following,
      this._posts,
      this._joinDate,
      this._followersCount,
      this._followingCount);

  int get id => this._id;

  String get password => this._password;

  String get handle => this._handle;

  String get name => this._name;

  String get email => this._email;

  String get bio => this._bio;

  int get profileImageId => this._profileImageId;

  int get headerImageId => this._headerImageId;

  List<int> get followers => this._followers;

  List<int> get following => this._following;

  List<int> get posts => this._posts;

  String get joinDate => this._joinDate;

  String get followersCount => this._followersCount;

  String get followingCount => this._followingCount;
}
