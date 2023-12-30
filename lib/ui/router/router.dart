import 'package:booking/ui/page/all_hotels.dart';
import 'package:booking/ui/page/details.dart';
import 'package:booking/ui/page/home.dart';
import 'package:booking/ui/page/main_page.dart';
import 'package:booking/ui/widget/home/home_part.dart';
import 'package:booking/ui/widget/map/yandex_maplit.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../widget/map/yandex_map.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _subshellNavigatorKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) =>
          MainPage(child: child),
      routes: [
        GoRoute(
          path: '/all',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => AllHotels(items: List<String>.generate(100, (i) => 'Item $i')),
        ),
        GoRoute(
          path: '/',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => HomePage(child: HomePart(),),
        ),
        GoRoute(
          path: '/map',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => HomePage(child: ClusterizedPlacemarkCollectionPage(),),
        ),
        GoRoute(
          path: '/details',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const Details(),
        )
      ],
    )
  ],
);
