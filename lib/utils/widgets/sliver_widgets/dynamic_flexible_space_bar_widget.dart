import 'package:flutter/material.dart';

Widget dyanmicFlexibleSpaceBar({
  @required BuildContext context,
  @required String title,
  String assetImage,
  String networkImageUrl,
}) {
  return FlexibleSpaceBar(
    title: Text(
      "$title",
      maxLines: 3,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Theme.of(context).primaryColorLight,
          fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    background: Stack(
      children: <Widget>[
        ClipRRect(
          child: Image(
            width: double.infinity,
            height: double.infinity,
            image: AssetImage(
                  "$assetImage",
                ) ??
                NetworkImage("$networkImageUrl"),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.7),
        )
      ],
    ),
  );
}
