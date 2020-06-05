import 'package:bona_blog/utils/widgets/sliver_widgets/dynamic_flexible_space_bar_widget.dart';
import 'package:flutter/material.dart';

class DynamicSliverAppBar extends StatefulWidget {
  final String title;
  final String assetImage;
  final String networkImageUrl;

  const DynamicSliverAppBar(
      {Key key, this.title, this.assetImage, this.networkImageUrl})
      : super(key: key);
  @override
  _DynamicSliverAppBarState createState() => _DynamicSliverAppBarState();
}

class _DynamicSliverAppBarState extends State<DynamicSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    String assetImage = widget.assetImage;
    String networkImageUrl = widget.networkImageUrl;

    return SliverAppBar(
        pinned: true,
        expandedHeight: 200,
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        flexibleSpace: dyanmicFlexibleSpaceBar(
            context: context,
            title: title,
            assetImage: assetImage,
            networkImageUrl: networkImageUrl));
  }
}
