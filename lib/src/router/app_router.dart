import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/webview/webview.dart';

import '../top_news/top_news.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: Topnews.page,
          initial: true,
        ),
        AutoRoute(
          path: '/view',
          page: WebviewRoute.page,
        ),
      ];
}
