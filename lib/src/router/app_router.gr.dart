// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    Topnews.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TopNewsScreen(),
      );
    },
    WebviewRoute.name: (routeData) {
      final args = routeData.argsAs<WebviewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WebviewScreen(
          key: args.key,
          url: args.url,
        ),
      );
    },
  };
}

/// generated route for
/// [TopNewsScreen]
class Topnews extends PageRouteInfo<void> {
  const Topnews({List<PageRouteInfo>? children})
      : super(
          Topnews.name,
          initialChildren: children,
        );

  static const String name = 'Topnews';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WebviewScreen]
class WebviewRoute extends PageRouteInfo<WebviewRouteArgs> {
  WebviewRoute({
    Key? key,
    required String url,
    List<PageRouteInfo>? children,
  }) : super(
          WebviewRoute.name,
          args: WebviewRouteArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'WebviewRoute';

  static const PageInfo<WebviewRouteArgs> page =
      PageInfo<WebviewRouteArgs>(name);
}

class WebviewRouteArgs {
  const WebviewRouteArgs({
    this.key,
    required this.url,
  });

  final Key? key;

  final String url;

  @override
  String toString() {
    return 'WebviewRouteArgs{key: $key, url: $url}';
  }
}
