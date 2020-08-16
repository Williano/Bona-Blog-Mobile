import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bona_blog/data/repositories/category_repository/category_repository.dart';
import 'package:bona_blog/features/article/data/model/article_model.dart';
import 'package:bona_blog/models/category_models/category_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({@required this.categoryRepository});

  @override
  CategoryState get initialState => CategoryEmpty();

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is GetCategoriesEvent) {
      yield* _mapGetCategoriesEventToState(event);
    } else if (event is GetCategoryArticlesEvent) {
      yield* _mapGetCategoryArticlesEventToState(event);
    }
  }

  Stream<CategoryState> _mapGetCategoriesEventToState(
      GetCategoriesEvent event) async* {
    try {
      final List<ArticleCategoryModel> categories =
          await categoryRepository.getAllCategories();
      yield CategoriesLoaded(categories: categories);
    } catch (_) {
      yield CategoryError();
    }
  }

  Stream<CategoryState> _mapGetCategoryArticlesEventToState(
      GetCategoryArticlesEvent event) async* {
    try {
      final articles = await categoryRepository.getCategoryArticles(
          categoryId: event.categoryId);
      yield CategoryArticlesLoaded(categoryArticles: articles);
    } catch (_) {
      yield CategoryError();
    }
  }
}
