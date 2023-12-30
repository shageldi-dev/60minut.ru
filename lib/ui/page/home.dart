import 'package:booking/ui/page/details.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/theme/typography.dart';
import 'package:booking/ui/widget/home/ShortFilter.dart';
import 'package:booking/ui/widget/home/home_actions.dart';
import 'package:booking/ui/widget/home/home_list.dart';
import 'package:booking/ui/widget/home/home_part.dart';
import 'package:booking/ui/widget/map/yandex_maplit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/HomeController.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  const HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  @override
  void initState() {
    _controller.fetchDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        ListenableBuilder(listenable: _controller, builder: (BuildContext context, Widget? child){
          return HomeActions(result: _controller.result,);
        }),
        const SizedBox(
          height: 16,
        ),
        const ShortFilter(),
        const SizedBox(
          height: 16,
        ),
        Expanded(child: widget.child)
      ],
    );
  }
}
