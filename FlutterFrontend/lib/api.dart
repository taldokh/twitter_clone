import 'package:FlutterFrontend/models/post.dart';

import './data.dart';

class Api {
  static like(int postID, int userID) {
    Post unupdatedPost = posts.firstWhere((post) => post.postId == postID);
    if (!unupdatedPost.likes.contains(userID)) {
      unupdatedPost.likes.add(userID);
    }
  }

  static dislike(int postID, int userID) {
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
}
