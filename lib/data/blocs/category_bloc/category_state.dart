part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryEmpty extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoriesLoaded extends CategoryState {
  final List<ArticleCategoryModel> categories;

  const CategoriesLoaded({@required this.categories});
  @override
  List<Object> get props => [categories];
}

class CategoryArticlesLoaded extends CategoryState {
  final List<ArticleModel> categoryArticles;

  const CategoryArticlesLoaded({@required this.categoryArticles});

  @override
  List<Object> get props => [categoryArticles];
}

class CategoryError extends CategoryState {
  final String errorMessage;
  const CategoryError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
