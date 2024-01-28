import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/repositories/models/article.dart';
import 'package:news_app/src/router/app_router.dart';
import 'package:news_app/src/widgets/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

/// ArticleItem is a widget that displays a single article.
class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: FractionallySizedBox(
        widthFactor: 0.95,
        child: _ArticleItemBuilder(article: article),
      ),
      tablet: FractionallySizedBox(
        widthFactor: 0.8,
        child: _ArticleItemBuilder(article: article),
      ),
      desktop: FractionallySizedBox(
        widthFactor: 0.6,
        child: _ArticleItemBuilder(article: article),
      ),
    );
  }
}

class _ArticleItemBuilder extends StatelessWidget {
  const _ArticleItemBuilder({
    required this.article,
  });
  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        /// Launch the article in a browser if the platform is web or desktop.
        if (kIsWeb || !(Platform.isIOS || Platform.isAndroid)) {
          if (!await launchUrl(Uri.parse(article.url))) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Could not launch ${article.url}'),
                ),
              );
            }
          }
        } else {
          /// Otherwise, navigate to the webview screen.
          context.router.push(
            WebviewRoute(url: article.url),
          );
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              /// Display the image if it exists.
              SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              /// Display the title and description.
              Expanded(
                flex: 4,
                child: ListTile(
                  title: Text(article.title),
                  subtitle: Text(
                    article.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  isThreeLine: true,
                  dense: false,
                ),
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
