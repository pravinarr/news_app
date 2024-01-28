import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/src/repositories/models/article.dart';

class NewsRepository {
  factory NewsRepository() => _instance;

  NewsRepository._internal() {
    db = FirebaseFirestore.instance;
  }
  static final NewsRepository _instance = NewsRepository._internal();
  late final FirebaseFirestore db;

  Future<List<Article>> getTopNews() async {
    final news = await db.collection('articles').get();
    final result = news.docs.map((e) => Article.fromJson(e.data())).toList();
    result
        .sort((a, b) => b.publishedAtDateTime.compareTo(a.publishedAtDateTime));
    return result;
  }
}
