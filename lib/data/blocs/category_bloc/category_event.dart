part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class GetCategories extends CategoryEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    String status = "Categories retrieved";
    return status;
  }
}

class GetCategoryArticles extends CategoryEvent {
  final int categoryId;

  const GetCategoryArticles({@required this.categoryId});

  @override
  List<Object> get props => [categoryId];

  @override
  String toString() {
    String status = "Category articles retrieved";
    return status;
  }
}
