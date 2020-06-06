import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bona_blog/models/article_models/article_model.dart';
import 'package:bona_blog/models/category_models/category_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  @override
  CategoryState get initialState => CategoryEmpty();

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {}
}
