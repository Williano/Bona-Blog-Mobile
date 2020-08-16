import 'package:bona_blog/data/blocs/category_bloc/category_bloc.dart';
import 'package:bona_blog/features/article/data/model/article_model.dart';
import 'package:bona_blog/shared/widgets/card_widgets/article_card_widget.dart';
import 'package:bona_blog/shared/widgets/loading_widget/loading_widget.dart';
import 'package:bona_blog/shared/widgets/sliver_widgets/dynamic_sliver_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CateoryArticlesListScreen extends StatefulWidget {
  final String categoryName;
  final String categoryImageURL;
  final int categoryIndex;

  const CateoryArticlesListScreen(
      {Key key,
      @required this.categoryName,
      @required this.categoryImageURL,
      this.categoryIndex})
      : super(key: key);

  @override
  _CateoryArticlesListScreenState createState() =>
      _CateoryArticlesListScreenState();
}

class _CateoryArticlesListScreenState extends State<CateoryArticlesListScreen> {
  Map<String, dynamic> _categoryData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Immediately trigger the event
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    categoryBloc
        .add(GetCategoryArticlesEvent(categoryId: widget.categoryIndex));
    _categoryData = {
      "categoryName": widget.categoryName,
      "categoryImageURL": widget.categoryImageURL
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<CategoryBloc, CategoryState>(
            listener: (context, state) {
              if (state is CategoryError) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
              }
            },
          )
        ],
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return LoadingWidget();
            } else if (state is CategoryArticlesLoaded) {
              if (state.categoryArticles.isEmpty) {
                return Center(child: Text('No Articles'));
              }

              return DisplayCategoryArticlesWidget(
                articles: state.categoryArticles,
                categoryData: _categoryData,
              );
            } else if (state is CategoryError) {
              return Center(child: Text(state.errorMessage));
            } else {
              return LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}

class DisplayCategoryArticlesWidget extends StatelessWidget {
  final Map categoryData;
  final List<Article> articles;
  const DisplayCategoryArticlesWidget({
    Key key,
    @required this.categoryData,
    @required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        DynamicSliverAppBar(
            title: categoryData["categoryName"],
            assetImage: categoryData["categoryImageURL"]),
        SliverList(
            key: PageStorageKey("Category articles"),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int articleIndex) {
                return ArticleCard(
                    articleAuthor: articles[articleIndex].author,
                    articleTitle: articles[articleIndex].title,
                    articleCategory: articles[articleIndex].category,
                    articleImageUrl: articles[articleIndex].imageURL,
                    articleDatePublishedOn:
                        articles[articleIndex].datePublishedOn,
                    articleReadTime: articles[articleIndex].readTime,
                    articleNumberOfViews: articles[articleIndex].numberOfViews);
              },
              childCount: articles.length,
            )),
      ],
    );
  }
}
