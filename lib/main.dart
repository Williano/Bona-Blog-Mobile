import 'package:bona_blog/routes/router.dart';
import 'package:bona_blog/screens/home_screen.dart';
import 'package:bona_blog/utilities/route_constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(BonaBlog());

class BonaBlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: generateRoute,
      initialRoute: HomeScreenRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
