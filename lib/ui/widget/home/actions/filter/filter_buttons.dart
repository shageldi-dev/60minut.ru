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
          spacing: 22.5,
        children: buttons.map((e) => AppButton(e, () { })).toList(),
      ),
    );
  }
}

class KFilterButton extends StatelessWidget {
  final List<String> buttons;
  const KFilterButton({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.fromLTRB(0, 16, 16, 16),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        spacing: 26,
        children: buttons.map((e) => AppButton(e, () { })).toList(),
      ),
    );
  }
}
