import 'models/user.dart';
import 'models/post.dart';
import 'models/text_content.dart';
import 'models/image_and_text_content.dart';
import 'models/image_content.dart';
import 'package:flutter/material.dart';

const int loggedInUser = 1;

List<User> users = [
  User(
      1,
      'Password1',
      "Dwayne Johnson",
      "TheRock",
      "therock@gmail.com",
      "CEO Seven Bucks Companies",
      Image.asset("assets/images/photo1.jpeg"),
      Image.asset(
        "assets/images/header_photo1.jpg",
      ),
      [2],
      [2, 3],
      [3],
      "February 2011",
      '1',
      '2'),
  User(
      2,
      'Password22',
      "Jimmy Kimmel Live",
      "JimmyKimmelLive",
      "jimmykimmellive@gmail.com",
      "The official Twitter for Jimmy Kimmel Live with @JimmyKimmel on ABC! We have fun. ",
      Image.asset("assets/images/photo2.jpg"),
      Image.asset(
        "assets/images/header_photo2.jpg",
      ),
      [1, 3],
      [1, 3],
      [1, 4],
      "April 2009",
      '2',
      '2'),
  User(
      3,
      'Password333',
      "Gal Gadot",
      "GalGadot",
      "galgadot@gmail.com",
      "",
      Image.asset("assets/images/photo3.jpg"),
      Image.asset(
        "assets/images/header_photo3.jpg",
      ),
      [1, 2],
      [2],
      [2, 5],
      "April 2009",
      '2',
      '1'),
];

List<Post> posts = [
  Post(
      1,
      2,
      TextContent(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
      [1, 3],
      List.empty(),
      '17h'),
  Post(
      2,
      3,
      ImageAndTextContent(
          Image.asset(
            'assets/images/post_image31.jpg',
          ),
          'Took some time off and spent it at my favorite place, the sound of the waves, the smell of the ocean, the sand in my toes, those always make me calmer, happier and ready for anything...'),
      [1, 3],
      List.empty(),
      '22h'),
  Post(
      3,
      1,
      ImageAndTextContent(
          Image.asset(
            'assets/images/post_image11.jpg',
            fit: BoxFit.fill,
          ),
          'It’s time to level up. \nClick to shop the latest collection: http://projectrock.online/tpp\n#ThroughTheWork\n#ProjectRock\n@TheRock'),
      [3],
      List.empty(),
      'Jun 1'),
  Post(
      4,
      2,
      TextContent(
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      [1],
      List.empty(),
      'May 20'),
  Post(
      5,
      3,
      ImageContent(Image.asset(
        'assets/images/post_image32.jpg',
      )),
      [1, 2],
      List.empty(),
      'Apr 8'),
];
