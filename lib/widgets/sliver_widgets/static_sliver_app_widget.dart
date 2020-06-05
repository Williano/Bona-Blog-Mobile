import 'package:flutter/material.dart';

class StaticSliverAppBar extends StatelessWidget {
  final String title;
  final String assetImage;
  final String networkImageUrl;

  const StaticSliverAppBar(
      {Key key, this.title, this.assetImage, this.networkImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        pinned: true,
        expandedHeight: 200,
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        flexibleSpace: StaticSliverAppBar(
            title: title,
            assetImage: assetImage,
            networkImageUrl: networkImageUrl));
  }
}
