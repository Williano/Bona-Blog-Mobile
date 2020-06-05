import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'article_bloc_event.dart';
part 'article_bloc_state.dart';

class ArticleBlocBloc extends Bloc<ArticleBlocEvent, ArticleBlocState> {
  @override
  ArticleBlocState get initialState => ArticleBlocInitial();

  @override
  Stream<ArticleBlocState> mapEventToState(
    ArticleBlocEvent event,
  ) async* {}
}
