import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/home/actions/action_buttons.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_buttons.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_by_time.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_price.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_rating.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_search.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_segmented_buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../features/home/models/filter_options.dart';

class FilterDialog extends StatefulWidget {
  final FilterOptions? result;
  const FilterDialog({super.key, this.result});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: white,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
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
                            flex: 90,
                          ),
                          GestureDetector(
                            child: Expanded(
                              child: Icon(Icons.close),
                              flex: 10,
                            ),
                            onTap: () => {context.pop()},
                          )
                        ],
                      ),
                    ),
                    FilterByTime(),
                    Divider(),
                    FilterSegmentedButtons(buttons: widget.result?.priceType!.toJson().entries.map((e) => e.value.toString()).toList()??[]),
                    FilterPrice(result: widget.result,),
                    Divider(),
                    FilterSearch(),
                    Divider(),
                    FilterRating(),
                    FilterSegmentedButtons(
                        buttons: widget.result?.rating!.map((e) => "${e.toString()}").toList()??[]),
                    Divider(),
                    FilterButtons(buttons: []),
                    Divider(),
                    FilterButtons(buttons: [
                      "Санузел",
                      "Душ",
                      "Ванна",
                      "Сауна",
                      "Халаты",
                      "Круглая кровать"
                    ]),
                  ],
                ),
              ),
            ),
            flex: 90,
          ),
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: Color(0xB2454545)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: [
                        Text(
                          'Найдено:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'MullerNarrow',
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ),
                  ),
                  ActionButtons(
                    backgroundColor: Colors.transparent,
                  )
                ],
              ),
            ),
            flex: 10,
          )
        ],
      ),
    );
  }
}
