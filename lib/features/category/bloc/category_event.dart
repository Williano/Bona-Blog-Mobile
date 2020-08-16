part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class GetCategoriesEvent extends CategoryEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    String status = "Categories retrieved";
    return status;
  }
}

class GetCategoryArticlesEvent extends CategoryEvent {
  final int categoryId;

  const GetCategoryArticlesEvent({@required this.categoryId});

  @override
  List<Object> get props => [categoryId];

  @override
  String toString() {
    String status = "Category articles retrieved";
    return status;
  }
}
