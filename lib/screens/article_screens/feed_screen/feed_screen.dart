import 'package:bona_blog/data/blocs/article_bloc/article_bloc.dart';
import 'package:bona_blog/data/blocs/category_bloc/category_bloc.dart';
import 'package:bona_blog/screens/article_screens/feed_screen/article_display_widget.dart';
import 'package:bona_blog/widgets/custom_title_widget.dart';
import 'package:bona_blog/widgets/loading_widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_display_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key key}) : super(key: key);
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    categoryBloc.add(GetCategoriesEvent());

    final articleBloc = BlocProvider.of<ArticleBloc>(context);
    articleBloc.add(GetArticlesEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Feed",
          style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 12.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    CustomTitle(title: "Categories"),
                  ],
                )),
            Container(
              height: 130.0,
              child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                if (state is CategoryEmpty) {
                  return LoadingWidget();
                } else if (state is CategoriesLoaded) {
                  if (state.categories.isEmpty) {
                    return Center(child: Text('No Categories'));
                  }
                  return DisplayCategoriesWidget(
                    key: PageStorageKey("categories list"),
                    categories: state.categories,
                  );
                } else if (state is CategoryError) {
                  return LoadingWidget();
                }
              }),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Row(
                children: <Widget>[
                  CustomTitle(title: "Latest Articles"),
                ],
              ),
            ),
            Expanded(
                child: MultiBlocListener(
                    listeners: [
                  BlocListener<ArticleBloc, ArticleState>(
                    listener: (context, state) {
                      if (state is ArticleError) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                          ),
                        );
                      }
                    },
                  ),
                  BlocListener<ArticleBloc, ArticleState>(
                    listener: (context, state) {
                      if (state is ArticleSuccess) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                  ),
                ],
                    child: BlocBuilder<ArticleBloc, ArticleState>(
                      builder: (context, state) {
                        if (state is ArticleEmpty) {
                          return LoadingWidget();
                        } else if (state is ArticlesLoaded) {
                          if (state.articles.isEmpty) {
                            return Center(child: Text('No Articles'));
                          }
                          return DisplayArticlesWidget(
                            key: PageStorageKey("articles list"),
                            articles: state.articles,
                          );
                        } else if (state is ArticleSuccess) {
                          return LoadingWidget();
                        } else if (state is ArticleError) {
                          return LoadingWidget();
                        }
                      },
                    )))
          ],
        ),
      ),
    );
  }
}
