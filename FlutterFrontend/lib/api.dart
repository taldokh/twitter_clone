import 'dart:convert';
import 'package:FlutterFrontend/models/fetched_drawer.dart';
import 'package:FlutterFrontend/models/fetched_user.dart';
import 'package:flutter/material.dart';
import 'package:FlutterFrontend/models/post.dart';
import 'package:FlutterFrontend/widgets/user_post.dart';
import './data.dart';
import 'models/fetched_post.dart';
import 'models/user.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String ApiURL = 'http://10.0.2.2:3000/';

  static like(int postID, int userID) {
    Post unupdatedPost = posts.firstWhere((post) => post.postId == postID);
    if (!unupdatedPost.likes.contains(userID)) {
      unupdatedPost.likes.add(userID);
    }
  }

  static unlike(int postID, int userID) {
    Post unupdatedPost = posts.firstWhere((post) => post.postId == postID);
    if (unupdatedPost.likes.contains(userID)) {
      unupdatedPost.likes.remove(userID);
    }
  }

  static ImageProvider postImage(int postId) {
    return NetworkImage('${ApiURL}post/image/$postId');
  }

  static Future<int> autenticate(String handle, String password) async {
    final response = await http
        .get(Uri.parse('${ApiURL}user/autenticate/$handle/$password'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['_id'];
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Future<List<UserPost>> fetchProfilePageWallPosts(int userId) async {
    final response =
        await http.get(Uri.parse('${ApiURL}post/profile_page/$userId'));
    if (response.statusCode == 200) {
      Iterable jsonList = json.decode(response.body);
      return List<UserPost>.from(
          jsonList.map((postJson) => UserPost(FetchedPost.fromJson(postJson))));
    } else {
      throw Exception('Failed to load');
    }
  }

  static Future<List<UserPost>> fetchHomeWallPosts(int userId) async {
    final response = await http.get(Uri.parse('${ApiURL}post/home/$userId'));
    if (response.statusCode == 200) {
      Iterable jsonList = json.decode(response.body);
      return List<UserPost>.from(
          jsonList.map((postJson) => UserPost(FetchedPost.fromJson(postJson))));
    } else {
      throw Exception('Failed to load');
    }
  }

  static Future<FetchedUser> fetchUser(int userId) async {
    final response =
        await http.get(Uri.parse('${ApiURL}user/profile_page_details/$userId'));

    if (response.statusCode == 200) {
      return FetchedUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  static ImageProvider userProfileImage(int userId) {
    return NetworkImage('${ApiURL}user/profile_image/$userId');
  }

  static ImageProvider userHeaderImage(int userId) {
    return NetworkImage('${ApiURL}user/header_image/$userId');
  }

  static Future<FetchedDrawer> drawerDetails(int userId) async {
    final response =
        await http.get(Uri.parse('${ApiURL}user/drawer_details/$userId'));

    if (response.statusCode == 200) {
      return FetchedDrawer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
