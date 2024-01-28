import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/repositories/models/article.dart';
import 'package:news_app/src/repositories/news_repository.dart';

part 'top_news_event.dart';
part 'top_news_state.dart';

class TopNewsBloc extends Bloc<TopNewsEvent, TopNewsState> {
  TopNewsBloc({
    required NewsRepository newsService,
  })  : _newsService = newsService,
        super(TopNewsInitial()) {
    on<LoadTopNewEvent>(_loadTopNews);
  }

  final NewsRepository _newsService;

  void _loadTopNews(
    LoadTopNewEvent event,
    Emitter<TopNewsState> emit,
  ) async {
    try {
      emit(TopNewsLoaded(articles: await _newsService.getTopNews()));
    } catch (e) {
      emit(TopNewsError(message: e.toString()));
    }
  }
}
