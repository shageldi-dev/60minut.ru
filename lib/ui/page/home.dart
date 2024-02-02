import 'package:booking/ui/page/details.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/theme/typography.dart';
import 'package:booking/ui/widget/app_bar.dart';
import 'package:booking/ui/widget/app_drawer.dart';
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
    //  _controller.fetchSearchHotel(_controller.searchingText);
    // print('[[[[[[[[[[[[[[[[[[[[[[object]]]]]]]]]]]]]]]]]]]]]]');
    //   print(_controller.searchResult);
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
        ListenableBuilder(
            listenable: _controller,
            builder: (BuildContext context, Widget? child) {
              return HomeActions(
                result: _controller.result,
                controller: _controller,
              );
            }),
        const SizedBox(
          height: 16,
        ),
        // ShortFilter(onPressed: _controller.onShortFilterPressed),
        ShortFilter(onPressed: (val) {}),
        const SizedBox(
          height: 16,
        ),
        Expanded(child: widget.child)

        // ShortFilter(onPressed: onShortFilterPressed, result: _controller.result,),
        // const SizedBox(
        //   height: 16,
        // ),
        //  Expanded(child: HomePartPage(filteredHotels: _controller.filteredHotels))
        //  HomePartPage()
      ],
    );
  }
}
