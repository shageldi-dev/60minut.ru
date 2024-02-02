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
            flex: 90,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 90,
                            child: Text(
                              'Фильтр',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF2F2F2F),
                                fontSize: 24,
                                fontFamily: 'MullerNarrow',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: const Icon(Icons.close),
                            onTap: () => {context.pop()},
                          )
                        ],
                      ),
                    ),
                    const FilterByTime(),
                    const Divider(),
                    FilterSegmentedButtons(
                      buttons: widget.result?.priceType!
                              .toJson()
                              .entries
                              .map((e) => e.value.toString())
                              .toList() ??
                          [],
                      onSelected: (p0, p1) {},
                    ),
                    FilterPrice(
                      result: widget.result,
                      onFromChange: (p0) {},
                      onToChange: (p0) {},
                    ),
                    const Divider(),
                    const FilterSearch(),
                    const Divider(),
                    const FilterRating(),
                    FilterSegmentedButtons(
                      buttons: widget.result?.rating!
                              .map((e) => e.toString())
                              .toList() ??
                          [],
                      onSelected: (p0, p1) {},
                    ),
                    const Divider(),
                    // MapEntry<String, Room>?  roomEntry = hotelDetails.rooms!.entries.elementAt(index);
                    // Room? room = roomEntry.value;
                    FilterButtons(
                        buttons: widget.result?.r!.keys
                                .map((e) => e.toString())
                                .toList() ??
                            []

                        // [
                        //   "Санузел",
                        //   "Душ",
                        //   "Ванна",
                        //   "Сауна",
                        //   "Халаты",
                        //   "Круглая кровать"
                        // ]
                        ),
                    const Divider(),
                    KFilterButton(
                        buttons: widget.result?.h!
                                .toJson()
                                .entries
                                .map((e) => e.value.toString())
                                .toList() ??
                            []
                        //[
                        //   "Своя парковка",
                        //   "Бар/ресторан",
                        //   "Доставка еды и напитков б номер","Wifi",
                        //   "Безналичная оплата",
                        //
                        // ]
                        ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(color: Color(0xB2454545)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
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
                    onClearClicked: () {},
                    onOkClicked: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
