part of 'top_news_bloc.dart';

@immutable
sealed class TopNewsEvent {}

final class LoadTopNewEvent extends TopNewsEvent {}
