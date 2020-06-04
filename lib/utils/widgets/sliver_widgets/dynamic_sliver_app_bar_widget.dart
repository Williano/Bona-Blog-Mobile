import 'package:bona_blog/utils/widgets/sliver_widgets/dynamic_flexible_space_bar_widget.dart';
import 'package:flutter/material.dart';

Widget dynamicSliverAppBar({
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
      flexibleSpace: dyanmicFlexibleSpaceBar(
          context: context,
          title: title,
          assetImage: assetImage,
          networkImageUrl: networkImageUrl));
}
