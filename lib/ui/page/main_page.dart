import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/theme/typography.dart';
import 'package:booking/ui/widget/app_bar.dart';
import 'package:booking/ui/widget/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  final Widget? child;
  final HomeController controller;
  const MainPage({super.key, this.child, required this.controller});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
    return Scaffold(
      key: _key,
      backgroundColor: grayLightButton,
      body: child,
      drawer: AppDrawer(
        controller: controller,
      ),
      drawerEnableOpenDragGesture: true,
      appBar: MyAppBar(),
    );
  }
}
