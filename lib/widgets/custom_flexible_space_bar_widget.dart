import 'package:flutter/material.dart';

Widget customFlexibleSpaceBar(
    {@required BuildContext context,
    @required String title,
    String assetImage,
    String networkImageUrl}) {
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
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                          "$assetImage",
                        ) ??
                        NetworkImage("$networkImageUrl"),
                    fit: BoxFit.fill)),
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          )
        ],
      ));
}
