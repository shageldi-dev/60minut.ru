import 'dart:io';
import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/features/home/data/RatingController.dart';
import 'package:booking/ui/page/home.dart';
import 'package:booking/ui/page/main_page.dart';
import 'package:booking/ui/router/router.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'di.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await initLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeController()),
      ChangeNotifierProvider(create: (context) => RatingController()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: primaryColor, primary: primaryColor),
          useMaterial3: false,
          fontFamily: 'Averta'),
      routerConfig: router,
    );
  }
}
