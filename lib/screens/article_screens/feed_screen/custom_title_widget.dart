import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      style: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, wordSpacing: 1.5),
    );
  }
}
