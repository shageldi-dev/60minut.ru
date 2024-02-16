import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/page/home.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/home/action_button.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_dialog.dart';
import 'package:booking/ui/widget/home/actions/search_dialog.dart';
import 'package:booking/ui/widget/home/actions/select_metro.dart';
import 'package:booking/ui/widget/home/actions/sort_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../features/home/models/filter_options.dart';
import 'buttons.dart';

class MapActions extends StatelessWidget {
  final FilterOptions? result;
  HomeController controller;

  MapActions({Key? key, this.result, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 16),
        Flexible(
          flex: 1,
          child: MapButton(
              icon: "assets/icons/search.svg",
              onClick: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => SearchDialog());
              }),
        ),
        const SizedBox(width: 12),
        Flexible(
          flex: 1,
          child: MapButton(
              icon: "assets/icons/Metro.svg",
              onClick: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => SelectMetro());
              }),
        ),
        const SizedBox(width: 12),
        Flexible(
          flex: 1,
          child: MapButton(
              icon: "assets/icons/scale.svg",
              onClick: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        FilterDialog(result: result));
              }),
        ),
        const SizedBox(width: 12),
        Flexible(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
              //shellNavigatorKey.currentState?.popUntil((route) => route.isFirst);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x0A000000), spreadRadius: 3, blurRadius: 5),
                ],
              ),
              height: 40,
              padding: const EdgeInsets.all(12),
              child: Row(children: [
                SvgPicture.asset("assets/icons/menu.svg"),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "К списку",
                  style: TextStyle(color: blackColor),
                ),
              ]),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
