import 'package:flutter/cupertino.dart';

// data object model that holds all the information related to a user
class User {
  final int _id;
  final String _name;
  final String _handle;
  final String _email;
  final String _bio;
  final Image _photo;
  final Image _headerPhoto;
  final List<int> _followers;
  final List<int> _following;
  final List<int> _posts;
  final String _joinDate;
  final int _followersCount;
  final int _followingCount;

  User(
      this._id,
      this._name,
      this._handle,
      this._email,
      this._bio,
      this._photo,
      this._headerPhoto,
      this._followers,
      this._following,
      this._posts,
      this._joinDate,
      this._followersCount,
      this._followingCount);

  int get id => this._id;

  String get handle => this._handle;

  String get name => this._name;

  String get email => this._email;

  String get bio => this._bio;

  Image get photo => this._photo;

  Image get headerPhoto => this._headerPhoto;

  List<int> get followers => this._followers;

  List<int> get following => this._following;

  List<int> get posts => this._posts;

  String get joinDate => this._joinDate;

  int get followersCount => this._followersCount;

  int get followingCount => this._followingCount;
}
