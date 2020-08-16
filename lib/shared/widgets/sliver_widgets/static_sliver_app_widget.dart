import 'package:bona_blog/shared/widgets/sliver_widgets/static_flexible_space_bar_widget.dart';
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
        flexibleSpace: StaticFlexibleSpaceBar(
            title: title,
            assetImage: assetImage,
            networkImageUrl: networkImageUrl));
  }
}
