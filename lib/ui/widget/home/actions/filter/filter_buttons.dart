import 'package:booking/ui/widget/home/actions/filter/filter_by_time.dart';
import 'package:flutter/material.dart';

class FilterButtons extends StatelessWidget {
  final List<String> buttons;
  const FilterButtons({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        spacing: 12,
        children: buttons.map((e) => AppButton(e, () { })).toList(),
      ),
    );
  }
}
