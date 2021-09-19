class FetchedDrawer {
  final String _name;
  final String _handle;
  final int _followersCount;
  final int _followingCount;

  FetchedDrawer(
      this._name,
      this._handle,
      this._followersCount,
      this._followingCount);

  factory FetchedDrawer.fromJson(Map<String, dynamic> json) {
    return FetchedDrawer(
      json['name'],
      json['handle'],
      json['followersCount'],
      json['followingCount'],
    );
  }

  String get handle => this._handle;

  String get name => this._name;

  int get followersCount => this._followersCount;

  int get followingCount => this._followingCount;
}
