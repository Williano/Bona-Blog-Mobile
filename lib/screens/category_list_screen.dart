import 'package:bona_blog/models/category_model.dart';
import 'package:bona_blog/widgets/custom_sliver_app_bar_widget.dart';
import 'package:flutter/material.dart';

class CategoryListScreen extends StatefulWidget {
  CategoryListScreen({Key key}) : super(key: key);
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  List<Category> _categories;

  @override
  void initState() {
    super.initState();
    _categories = Category.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          customSliverAppBar(
              context: context,
              title: "Categories",
              assetImage: "assets/images/food.jpg"),
          _categoriesSliverGrid()
        ],
      ),
    );
  }

  Widget _categoriesSliverGrid() => SliverGrid(
      delegate:
          SliverChildBuilderDelegate((BuildContext context, int categoryIndex) {
        return GestureDetector(
            onTap: () {
              print("${_categories[categoryIndex].name}");
            },
            child: _categoryCard(context, categoryIndex));
      }, childCount: _categories.length),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2));

  Widget _categoryCard(BuildContext context, int categoryIndex) {
    // Wrap Future Builder around
    return Card(
      // margin: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(_categories[categoryIndex].imageURL))),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          Positioned(
            left: 10.0,
            right: 10.0,
            bottom: 20.0,
            child: Text(
              _categories[categoryIndex].name,
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
      ),
    );
  }
}
