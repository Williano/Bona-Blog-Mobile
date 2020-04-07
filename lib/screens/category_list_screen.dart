import 'package:bona_blog/models/category_model.dart';
import 'package:bona_blog/screens/category_articles_list_screen.dart';
import 'package:bona_blog/utilities/route_constants_utils.dart';
import 'package:bona_blog/widgets/sliver_widgets/static_sliver_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({Key key}) : super(key: key);
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  List<ArticleCategory> _categories;

  @override
  void initState() {
    super.initState();
    _categories = ArticleCategory.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          staticSliverAppBar(
              context: context,
              title: "Categories",
              assetImage: "assets/images/food.jpg"),
          _categoriesSliverGrid()
        ],
      ),
    );
  }

  Widget _categoriesSliverGrid() {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
            (BuildContext context, int categoryIndex) {
          return _onCategoryTapped(
              context: context, categoryIndex: categoryIndex);
        }, childCount: _categories.length),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2));
  }

  Widget _onCategoryTapped({BuildContext context, int categoryIndex}) {
    return GestureDetector(
        onTap: () {
          Map<String, dynamic> data = {
            "categoryName": _categories[categoryIndex].name,
            "categoryImageURL": _categories[categoryIndex].imageURL,
          };

          pushNewScreenWithRouteSettings(context,
              screen: CateoryArticlesListScreen(
                categoryName: data["categoryName"],
                categoryImageURL: data["categoryImageURL"],
              ),
              settings: RouteSettings(name: CategoryArticlesListRoute));
        },
        child: _categoryCard(context, categoryIndex));
  }

  Widget _categoryCard(BuildContext context, int categoryIndex) {
    // Wrap Future Builder around
    return Card(
      // margin: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image(
              height: double.infinity,
              width: double.infinity,
              image: AssetImage(_categories[categoryIndex].imageURL),
              fit: BoxFit.cover,
            ),
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
