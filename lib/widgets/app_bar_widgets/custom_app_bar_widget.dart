import 'package:flutter/material.dart';

Widget customAppBar(
    {@required BuildContext context,
    @required bool showBackArrow,
    @required String title}) {
  return AppBar(
    automaticallyImplyLeading: showBackArrow,
    elevation: 0,
    title: Text(
      "$title",
      style: TextStyle(
          color: Theme.of(context).primaryColorLight,
          fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
  );
}
