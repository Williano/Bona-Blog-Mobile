import 'package:bona_blog/utilities/custom_material_color.dart';
import 'package:bona_blog/widgets/static_flexible_space_bar_widget.dart';
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
      backgroundColor: customColor,
      flexibleSpace: staticFlexibleSpaceBar(
          context: context,
          title: title,
          assetImage: assetImage,
          networkImageUrl: networkImageUrl));
}
