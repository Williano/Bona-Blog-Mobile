import 'package:bona_blog/data/models/category_models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required List<ArticleCategory> categories,
    @required this.context,
    @required this.categoryIndex,
  })  : _categories = categories,
        super(key: key);

  final List<ArticleCategory> _categories;
  final BuildContext context;
  final int categoryIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              height: 120.0,
              width: 120.0,
              image: AssetImage("${_categories[categoryIndex].imageURL}"),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).primaryColorDark.withOpacity(0.7)),
          ),
          Positioned(
            top: 20.0,
            left: 3.0,
            right: 3.0,
            bottom: 20.0,
            child: Center(
              child: Text(
                "${_categories[categoryIndex].name}",
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
