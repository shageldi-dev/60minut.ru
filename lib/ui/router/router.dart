import 'package:booking/di.dart';
import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/page/all_hotels.dart';
import 'package:booking/ui/page/details.dart';
import 'package:booking/ui/page/home.dart';
import 'package:booking/ui/page/like_page.dart';
import 'package:booking/ui/page/main_page.dart';
import 'package:booking/ui/page/all_romantic.dart';
import 'package:booking/ui/page/otel_mesyasa.dart';
import 'package:booking/ui/page/room_mesyasa.dart';
import 'package:booking/ui/page/top20.dart';
import 'package:booking/ui/widget/home/home_part.dart';
import 'package:booking/ui/widget/map/yandex_maplit.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widget/map/yandex_map.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();
final _subshellNavigatorKey = GlobalKey<NavigatorState>();

//HomeController controller = HomeController();
// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => MainPage(
        controller: locator<HomeController>.call(),
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/all',
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => const AllHotelsPage(),
        ),
        GoRoute(
          path: '/',
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => HomePage(
            child: HomePartPage(),
          ),
        ),
        GoRoute(
            path: '/map',
            parentNavigatorKey: shellNavigatorKey,
            builder: (context, state) {
              return HomePage(
                child: ClusterizedPlacemarkCollectionPage(),
              );
            }),
        GoRoute(
          path: '/details/:id',
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) =>
              DetailsPage(id: state.pathParameters['id']!),
        ),
        GoRoute(
          path: '/like',
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => LikePage(),
        ),
        GoRoute(
          path: '/top20',
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => Top20tPage(),
        ),
        GoRoute(
          path: '/mesyasRoom',
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => MesyasRoomPage(),
        ),
        GoRoute(
          path: '/mesyasOtel',
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) =>  MesyasOtelPage(),
        ),
        GoRoute(
          path: '/romantic',
          parentNavigatorKey: shellNavigatorKey,
          builder: (context, state) => HomePage(child: HomePartPage()),
        ),
      ],
    )
  ],
);
