import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/repositories/news_repository.dart';
import 'package:news_app/src/top_news/bloc/top_news_bloc.dart';
import 'package:news_app/src/top_news/views/article_item.dart';

@RoutePage(
  name: 'topnews',
)
class TopNewsScreen extends StatelessWidget {
  const TopNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Wrap the [TopNewsView] with a [BlocProvider] and provide the [TopNewsBloc]
    return BlocProvider(
      create: (context) => TopNewsBloc(
        newsService: context.read<NewsRepository>(),
      ),
      child: const TopNewsView(),
    );
  }
}

class TopNewsView extends StatefulWidget {
  const TopNewsView({super.key});

  @override
  State<TopNewsView> createState() => _TopNewsViewState();
}

class _TopNewsViewState extends State<TopNewsView> {
  @override
  void initState() {
    /// Load the top news articles when the view is initialized
    context.read<TopNewsBloc>().add(
          LoadTopNewEvent(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
      ),
      body: BlocBuilder<TopNewsBloc, TopNewsState>(
        builder: (context, state) {
          /// If the state is [TopNewsLoaded] and the articles list is empty,
          if (state is TopNewsLoaded && state.articles.isEmpty) {
            return const Center(
              child: Text('No articles found'),
            );
          }

          /// If the state is [TopNewsLoaded] and the articles list is not empty,
          else if (state is TopNewsLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              restorationId: 'topnews_list',
              padding: const EdgeInsets.only(top: 20),
              itemBuilder: (context, index) {
                final article = state.articles[index];
                return ArticleItem(article: article);
              },
            );
          }

          /// If the state is [TopNewsError], show the error message
          else if (state is TopNewsError) {
            return Center(
              child: Text(state.message),
            );
          }

          /// If the state is [TopNewsInitial] , show a progress indicator
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
