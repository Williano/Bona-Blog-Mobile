import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  @override
  ArticleState get initialState => ArticleInitial();

  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
