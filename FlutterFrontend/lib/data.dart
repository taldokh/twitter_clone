import 'models/user.dart';
import 'models/post.dart';
import 'models/text_content.dart';
import 'models/image_and_text_content.dart';
import 'models/image_content.dart';
import 'package:flutter/material.dart';

List<User> users = [
  User(
      1,
      "Benmcc",
      "Ben Mccallum",
      "Benmccall8349@gmail.com",
      "Politician, fighting agains climate change",
      Image.asset(
        "assets/images/randomPerson1.jpg",
        height: 100,
      ),
      [2],
      [2, 3],
      []),
  User(
      2,
      "Leyton_alv12",
      "Lleyton Alvarado",
      "mawicah179124@gmail.com",
      "Paleontologist, Live in new york",
      Image.asset(
        "assets/images/randomPerson2.jpg",
        height: 100,
      ),
      [1, 3],
      [1, 3],
      []),
  User(
      3,
      "AnnMan",
      "Annabelle Manning",
      "Annman3213@gmail.com",
      "",
      Image.asset(
        "assets/images/randomPerson3.jpg",
        height: 100,
      ),
      [1, 2],
      [2],
      []),
];

List<Post> posts = [
  Post(
      1,
      2,
      TextContent(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
      [1, 3],
      List.empty(),
      DateTime(2017)),
  Post(
      2,
      3,
      ImageAndTextContent(
          Image.asset(
            'assets/images/postImage1.jpg',
          ),
          'anim id est laborum.'),
      [1, 3],
      List.empty(),
      DateTime(2017)),
  Post(
      3,
      1,
      ImageAndTextContent(
          Image.asset(
            'assets/images/postImage2.jpg',
            fit: BoxFit.fill,
          ),
          'yammi...'),
      [1, 3],
      List.empty(),
      DateTime(2017)),
  Post(
      4,
      2,
      TextContent(
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      [1, 3],
      List.empty(),
      DateTime(2017)),
  Post(
      5,
      3,
      ImageContent(Image.asset(
        'assets/images/postImage3.jpg',
      )),
      [1, 3],
      List.empty(),
      DateTime(2017)),
];
