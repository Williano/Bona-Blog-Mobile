import 'package:bona_blog/data/blocs/category_bloc/category_bloc.dart';
import 'package:bona_blog/screens/category_screens/category_list_screen/category_card_widget.dart';
import 'package:bona_blog/utils/routes/route_constants_utils.dart';
import 'package:bona_blog/widgets/loading_widget/loading_widget.dart';
import 'package:bona_blog/widgets/sliver_widgets/static_sliver_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({Key key}) : super(key: key);
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  void initState() {
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    categoryBloc.add(GetCategoriesEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryEmpty) {
            return LoadingWidget();
          } else if (state is CategoriesLoaded) {
            if (state.categories.isEmpty) {
              return Center(child: Text('No Categories'));
            }
            return DisplayCategoriesWidget(
              key: PageStorageKey("categories grid list"),
              categories: state.categories,
            );
          } else if (state is CategoryError) {
            return LoadingWidget();
          }
        },
      ),
    );
  }
}

class DisplayCategoriesWidget extends StatelessWidget {
  const DisplayCategoriesWidget({
    Key key,
    @required this.categories,
  }) : super(key: key);

  final List categories;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        StaticSliverAppBar(
            title: "Categories", assetImage: "assets/images/food.jpg"),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int categoryIndex) {
              return GestureDetector(
                  onTap: () {
                    Map<String, dynamic> data = {
                      "categoryName": categories[categoryIndex].name,
                      "categoryImageURL": categories[categoryIndex].imageURL,
                    };

                    Navigator.pushNamed(context, CategoryArticlesListRoute,
                        arguments: data);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                    child: CategoryCard(
                        categories: categories, categoryIndex: categoryIndex),
                  ));
            }, childCount: categories.length),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
      ],
    );
  }
}
