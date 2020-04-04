import 'package:flutter/material.dart';

class CategoryListScreen extends StatefulWidget {
  CategoryListScreen({Key key}) : super(key: key);
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Categories",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container());
  }
}
