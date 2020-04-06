import 'package:bona_blog/utilities/custom_material_colors_utils.dart';
import 'package:bona_blog/widgets/dynamic_flexible_space_bar_widget.dart';
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
      backgroundColor: customColor,
      flexibleSpace: dyanmicFlexibleSpaceBar(
          context: context,
          title: title,
          assetImage: assetImage,
          networkImageUrl: networkImageUrl));
}
