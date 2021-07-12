import 'package:FlutterFrontend/models/session_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../api.dart';

class PostActionBar extends StatefulWidget {
  final List<int> _likes;
  final int _likesCount;
  final int _postID;

  PostActionBar(this._likes, this._likesCount, this._postID);

  @override
  _PostActionBarState createState() => _PostActionBarState();
}

class _PostActionBarState extends State<PostActionBar> {
  int likesCount;
  bool isLiked;

  @override
  void initState() {
    super.initState();
    likesCount = widget._likesCount;
    isLiked = _didUserLiked(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => setState(() {
                this.isLiked
                    ? dislike(
                        widget._postID,
                        Provider.of<SessionState>(context, listen: false)
                            .userID)
                    : like(
                        widget._postID,
                        Provider.of<SessionState>(context, listen: false)
                            .userID);
                this.isLiked = !this.isLiked;
                this.isLiked ? likesCount++ : likesCount--;
              }),
              child: Icon(
                this.isLiked ? Icons.favorite : Icons.favorite_outline,
                color: Color(0xFF536471),
              ),
            ),
            Text(this.likesCount.toString())
          ],
        ));
  }

  bool _didUserLiked(BuildContext context) {
    int userID = Provider.of<SessionState>(context, listen: false).userID;
    return widget._likes.contains(userID);
  }
}
