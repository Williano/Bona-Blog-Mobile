import 'package:bona_blog/models/category_model.dart';
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
    _categories = Category.getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Categories",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          child: _categoryGrid(),
        ));
  }

  Widget _categoryGrid() {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int categoryIndex) {
          return GestureDetector(
            onTap: () {
              print("Hello");
            },
            child: _categoryCard(categoryIndex),
          );
        });
  }

  Widget _categoryCard(int categoryIndex) {
    return Card(
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
