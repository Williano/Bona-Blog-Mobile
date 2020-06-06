import 'package:bona_blog/models/category_models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    Key key,
    @required this.categories,
    @required this.categoryIndex,
  }) : super(key: key);

  final List<ArticleCategoryModel> categories;
  final int categoryIndex;

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    // Wrap Future Builder around
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
            height: double.infinity,
            width: double.infinity,
            image: AssetImage(widget.categories[widget.categoryIndex].imageURL),
            fit: BoxFit.fill,
          ),
        ),
        ClipRRect(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          right: 10.0,
          bottom: 20.0,
          child: Text(
            widget.categories[widget.categoryIndex].name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
