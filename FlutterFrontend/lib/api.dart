import 'package:FlutterFrontend/models/post.dart';

import './data.dart';

like(int postID, int userID) {
  Post unupdatedPost = posts.firstWhere((post) => post.postId == postID);
  if (!unupdatedPost.likes.contains(userID)) {
    unupdatedPost.likes.add(userID);
  }
}

dislike(int postID, int userID) {
  Post unupdatedPost = posts.firstWhere((post) => post.postId == postID);
  if (unupdatedPost.likes.contains(userID)) {
    unupdatedPost.likes.remove(userID);
  }
}
