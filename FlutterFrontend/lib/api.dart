import 'package:flutter/material.dart';
import 'package:FlutterFrontend/models/post.dart';
import 'package:FlutterFrontend/widgets/user_post.dart';
import './data.dart';
import 'models/fetched_post.dart';
import 'models/user.dart';

class Api {
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

  static int autenticate(String userName, String password) {
    return users
        .firstWhere(
            (user) =>
                (user.handle == userName.trim() && user.password == password),
            orElse: () => null)
        .id;
  }

  static List<UserPost> fetchProfilePageWallPosts(int userID) {
    return posts
        .where((post) => post.userId == userID)
        .map((post) => UserPost(FetchedPost(
            post.postId,
            userImageById(post.userId),
            userNameById(post.userId),
            userHandleById(post.userId),
            post.uploadTime,
            post.content,
            post.likes,
            post.userId)))
        .toList();
  }

  static List<UserPost> fetchHomeWallPosts(int id) {
    List<int> followingUsersIDs =
        users.firstWhere((user) => user.id == id).following;

    List<int> followingUsersPostsIDs = users
        .where((user) => followingUsersIDs.contains(user.id))
        .map((user) => user.posts)
        .expand((postsIDs) => postsIDs)
        .toList();

    return posts
        .where((post) => followingUsersPostsIDs.contains(post.postId))
        .map((post) => UserPost(
              FetchedPost(
                  post.postId,
                  userImageById(post.userId),
                  userNameById(post.userId),
                  userHandleById(post.userId),
                  post.uploadTime,
                  post.content,
                  post.likes,
                  post.userId),
            ))
        .toList();
  }

  static User fetchUser(int userID) {
    return users.singleWhere((user) => user.id == userID);
  }

  static Image userImageById(int userId) {
    return users.firstWhere((user) => user.id == userId).photo;
  }

  static String userHandleById(int userId) {
    return users.firstWhere((user) => user.id == userId).handle;
  }

  static String userNameById(int userId) {
    return users.firstWhere((user) => user.id == userId).name;
  }

  static String userFollowersById(int userId) {
    return users.firstWhere((user) => user.id == userId).followersCount;
  }

  static String userFollowingById(int userId) {
    return users.firstWhere((user) => user.id == userId).followingCount;
  }
}
