import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/widget/home/action_button.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_dialog.dart';
import 'package:booking/ui/widget/home/actions/search_dialog.dart';
import 'package:booking/ui/widget/home/actions/select_metro.dart';
import 'package:booking/ui/widget/home/actions/sort_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/home/models/filter_options.dart';

class HomeActions extends StatelessWidget {
  final FilterOptions? result;
  const HomeActions({Key? key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 16),
        Flexible(
          flex: 1,
          child: HomeActionButton(
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
          child: HomeActionButton(
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
          child: HomeActionButton(
              icon: "assets/icons/scale.svg",
              onClick: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        FilterDialog(result: result));
              }),
        ),
        const SizedBox(width: 12),
        const Flexible(
          flex: 1,
          child: SortDropdown(),
        ),
        const SizedBox(width: 12),
        Flexible(
          flex: 1,
          child: HomeActionButton(
              icon: "assets/icons/location.svg",
              onClick: () {
                context.push("/map");
              }),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
