import 'package:bona_blog/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BonaBlog());

class BonaBlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
