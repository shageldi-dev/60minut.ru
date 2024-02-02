import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/home/actions/SearchChip.dart';
import 'package:booking/ui/widget/home/actions/action_buttons.dart';
import 'package:booking/ui/widget/home/actions/autocomplete_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
                            children: [
                              SearchChip(text: "м. Марьино"),
                              SizedBox(
                                width: 12,
                              ),
                              SearchChip(text: "Рандеву Марьино"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ActionButtons(
                      onClearClicked: () {},
                      onOkClicked: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
