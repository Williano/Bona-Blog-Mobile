import 'package:bona_blog/widgets/sliver_widgets/static_flexible_space_bar_widget.dart';
import 'package:flutter/material.dart';

Widget staticSliverAppBar({
  @required BuildContext context,
  @required String title,
  String assetImage,
  String networkImageUrl,
}) {
  return SliverAppBar(
      pinned: true,
      expandedHeight: 200,
      elevation: 0.0,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: staticFlexibleSpaceBar(
          context: context,
          title: title,
          assetImage: assetImage,
          networkImageUrl: networkImageUrl));
}
