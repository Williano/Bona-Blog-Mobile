import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class DyanmicFlexibleSpaceBar extends StatelessWidget {
  final String title;
  final String assetImage;
  final String networkImageUrl;

  const DyanmicFlexibleSpaceBar(
      {Key key, @required this.title, this.assetImage, this.networkImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
