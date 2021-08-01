let users: Array<User> = [new User(
    1,
    'Password1',
    "Dwayne Johnson",
    "TheRock",
    "therock@gmail.com",
    "CEO Seven Bucks Companies",
    "assets/images/photo1.jpeg",
    "assets/images/header_photo1.jpg",
    [2],
    [2, 3],
    [3],
    "February 2011",
    '1',
    '2'),
new User(
    2,
    'Password22',
    "Jimmy Kimmel Live",
    "JimmyKimmelLive",
    "jimmykimmellive@gmail.com",
    "The official Twitter for Jimmy Kimmel Live with @JimmyKimmel on ABC! We have fun. ",
    "assets/images/photo2.jpg",
    "assets/images/header_photo2.jpg",
    [1, 3],
    [1, 3],
    [1, 4],
    "April 2009",
    '2',
    '2'),
new User(
    3,
    'Password333',
    "Gal Gadot",
    "GalGadot",
    "galgadot@gmail.com",
    "",
    "assets/images/photo3.jpg",
    "assets/images/header_photo3.jpg"
    ,
    [1, 2],
    [2],
    [2, 5],
    "April 2009",
    '2',
    '1'),];

let posts: Array<Post> = [new Post(
    1,
    2,
    new TextContent(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    [1, 3],
    [],
    '17h'),
new Post(
    2,
    3,
    new ImageAndTextContent(
        'assets/images/post_image31.jpg',
        'Took some time off and spent it at my favorite place, the sound of the waves, the smell of the ocean, the sand in my toes, those always make me calmer, happier and ready for anything...'),
    [1, 3],
    [],
    '22h'),
new Post(
    3,
    1,
    new ImageAndTextContent(
        'assets/images/post_image11.jpg',
        'It’s time to level up. \nClick to shop the latest collection: http://projectrock.online/tpp\n#ThroughTheWork\n#ProjectRock\n@TheRock'),
    [3],
    [],
    'Jun 1'),
new Post(
    4,
    2,
    new TextContent(
        'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    [1],
    [],
    'May 20'),
new Post(
    5,
    3,
    new ImageContent(
        'assets/images/post_image32.jpg'
    ),
    [1, 2],
    [],
    'Apr 8'),];