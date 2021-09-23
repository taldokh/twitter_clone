class FetchedUser {
  final int _id;
  final String _name;
  final String _handle;
  final String _bio;
  final int _profileImageId;
  final int _headerImageId;
  final String _joinDate;
  final int _followersCount;
  final int _followingCount;

  FetchedUser(
      this._id,
      this._name,
      this._handle,
      this._bio,
      this._profileImageId,
      this._headerImageId,
      this._joinDate,
      this._followersCount,
      this._followingCount);

  factory FetchedUser.fromJson(Map<String, dynamic> json) {
    return FetchedUser(
      json['_id'],
      json['name'],
      json['handle'],
      json['bio'],
      json['profileImageId'],
      json['headerImageId'],
      json['joinDate'],
      json['followersCount'],
      json['followingCount'],
    );
  }

  int get id => this._id;

  String get handle => this._handle;

  String get name => this._name;

  String get bio => this._bio;

  int get profileImageId => this._profileImageId;

  int get headerImageId => this._headerImageId;

  String get joinDate => this._joinDate;

  int get followersCount => this._followersCount;

  int get followingCount => this._followingCount;
}
