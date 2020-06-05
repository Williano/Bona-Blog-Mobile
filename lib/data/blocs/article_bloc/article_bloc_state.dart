part of 'article_bloc_bloc.dart';

abstract class ArticleBlocState extends Equatable {
  const ArticleBlocState();
}

class ArticleBlocInitial extends ArticleBlocState {
  @override
  List<Object> get props => [];
}
