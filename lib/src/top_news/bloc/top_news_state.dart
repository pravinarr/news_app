part of 'top_news_bloc.dart';

@immutable
sealed class TopNewsState {}

final class TopNewsInitial extends TopNewsState {}

final class TopNewsLoaded extends TopNewsState {
  final List<Article> articles;
  TopNewsLoaded({
    required this.articles,
  });
}

final class TopNewsError extends TopNewsState {
  final String message;
  TopNewsError({
    required this.message,
  });
}
