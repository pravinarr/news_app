// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
// Visit https://flutter.dev/docs/cookbook/testing/widget/introduction for
// more information about Widget testing.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/src/repositories/models/article.dart';
import 'package:news_app/src/top_news/views/article_item.dart';

void main() {
  group('Article Item', () {
    final article = Article.fromJson({
      'title': 'title',
      'description': 'description',
      'url': 'url',
      'urlToImage':
          'https://variety.com/wp-content/uploads/2023/12/taylor-swift.jpg?w=1000&h=563&crop=1',
      'publishedAt': '2024-01-27T00:16:00Z',
      'content': 'content',
    });

    setUpAll(() => HttpOverrides.global = null);
    testWidgets('should display a title and description',
        (WidgetTester tester) async {
      final myWidget = MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: ArticleItem(
              article: article,
            ),
          ),
        ),
      );

      await tester.pumpWidget(myWidget);
      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.text('title'), findsOneWidget);
      expect(find.text('description'), findsOneWidget);
    });
  });
}
