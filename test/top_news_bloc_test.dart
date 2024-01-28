import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/src/repositories/models/article.dart';
import 'package:news_app/src/repositories/news_repository.dart';
import 'package:news_app/src/top_news/top_news.dart';

class MockNewsService extends Mock implements NewsRepository {}

void main() {
  NewsRepository repository = MockNewsService();

  final article = Article.fromJson({
    'title': 'title',
    'description': 'description',
    'url': 'url',
    'urlToImage': 'urlToImage',
    'publishedAt': '2024-01-27T00:16:00Z',
    'content': 'content',
  });

  group('TopNewsBloc', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => TopNewsBloc(
        newsService: repository,
      ),
      expect: () => [],
    );

    blocTest(
      'emits article loaded when event is added',
      build: () => TopNewsBloc(
        newsService: repository,
      ),
      setUp: () => when(() => repository.getTopNews()).thenAnswer(
        (_) async => [article],
      ),
      act: (bloc) => bloc.add(LoadTopNewEvent()),
      expect: () => [
        isA<TopNewsLoaded>()
            .having((p0) => p0.articles.length, 'Number of articles', 1)
      ],
    );

    blocTest(
      'emits article error when event is added',
      build: () => TopNewsBloc(
        newsService: repository,
      ),
      setUp: () =>
          when(() => repository.getTopNews()).thenThrow(Exception('Error')),
      act: (bloc) => bloc.add(LoadTopNewEvent()),
      expect: () => [isA<TopNewsError>()],
    );
  });
}
