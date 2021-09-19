import 'package:FlutterFrontend/models/session_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../api.dart';

class PostActionBar extends StatefulWidget {
  final int _likesCount;
  final bool _didLiked;
  final int _postID;

  PostActionBar(this._likesCount, this._didLiked, this._postID);

  @override
  _PostActionBarState createState() => _PostActionBarState();
}

class _PostActionBarState extends State<PostActionBar> {
  int likesCount;
  bool didLiked;

  @override
  void initState() {
    super.initState();
    likesCount = widget._likesCount;
    didLiked = widget._didLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => setState(() {
                this.didLiked
                    ? Api.unlike(
                        widget._postID,
                        Provider.of<SessionState>(context, listen: false)
                            .userID)
                    : Api.like(
                        widget._postID,
                        Provider.of<SessionState>(context, listen: false)
                            .userID);
                this.didLiked = !this.didLiked;
                this.didLiked ? likesCount++ : likesCount--;
              }),
              child: Icon(
                this.didLiked ? Icons.favorite : Icons.favorite_outline,
                color: Color(0xFF536471),
              ),
            ),
            Text(this.likesCount.toString())
          ],
        ));
  }
}
