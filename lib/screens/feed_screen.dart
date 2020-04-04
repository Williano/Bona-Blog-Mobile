import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key key}) : super(key: key);
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Feed",
          style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
