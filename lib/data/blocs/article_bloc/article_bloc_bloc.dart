import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'article_bloc_event.dart';
part 'article_bloc_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  @override
  ArticleState get initialState => ArticleEmpty();

  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {}
}
