import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_by_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterButtons extends StatefulWidget {
  final List<String> buttons;
  List<String>? values = [];
  FilterButtons({super.key, required this.buttons, this.values});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (BuildContext context, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              spacing: 22.5,
              children: widget.buttons
                  .map(
                    (e) => AppButton(e, () {
                      try {
                        controller.clickR(
                            widget.values![widget.buttons.indexOf(e)], e);
                      } catch (e) {
                        e.printError();
                      }
                    }, isSelected: controller.selectedR!.contains(e)),
                  )
                  .toList(),
            ),
          );
        });
  }
}

class KFilterButton extends StatefulWidget {
  final List<String> buttons;
  List<String>? values = [];
  KFilterButton({super.key, required this.buttons, this.values});

  @override
  State<KFilterButton> createState() => _KFilterButtonState();
}

class _KFilterButtonState extends State<KFilterButton> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (BuildContext context, Widget? child) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              spacing: 26,
              children: widget.buttons
                  .map((e) => AppButton(e, () {
                        print(widget.values);
                        try {
                          controller.clickH(
                              widget.values![widget.buttons.indexOf(e)], e);
                        } catch (e) {
                          e.printError();
                        }
                      }, isSelected: controller.selectedH!.contains(e)))
                  .toList(),
            ),
          );
        });
  }
}
