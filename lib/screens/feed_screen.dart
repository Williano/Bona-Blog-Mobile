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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Feed"),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
