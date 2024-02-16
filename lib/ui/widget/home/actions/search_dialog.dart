import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/home/actions/SearchChip.dart';
import 'package:booking/ui/widget/home/actions/action_buttons.dart';
import 'package:booking/ui/widget/home/actions/autocomplete_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog({super.key});

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  child: Wrap(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Expanded(
                                      flex: 90,
                                      child: SizedBox(
                                        child: Text(
                                          'Поиск',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF2F2F2F),
                                            fontSize: 24,
                                            fontFamily: 'MullerNarrow',
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: IconButton(
                                          onPressed: () => {context.pop()},
                                          icon: const Icon(
                                            Icons.close,
                                            color: iconColor,
                                          )),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                const AutocompleteSearch(),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: List.generate(
                                      controller.selectedMetroList!.length,
                                      (index) => Padding(
                                            padding: const EdgeInsets.all(6),
                                            child: SearchChip(
                                              text:
                                                  "м. ${controller.selectedMetroList![index]}",
                                              onRemove: (value) {
                                                print(value);
                                                controller.deleteMetroId(controller
                                                    .metroList!
                                                    .where((element) =>
                                                        "м. ${element.name}" ==
                                                        value)
                                                    .firstOrNull);
                                              },
                                            ),
                                          )),
                                ),
                              ],
                            ),
                          ),
                          ActionButtons(
                            onClearClicked: () {
                              controller.clearMetro();
                            },
                            onOkClicked: () {
                              context.pop();
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
