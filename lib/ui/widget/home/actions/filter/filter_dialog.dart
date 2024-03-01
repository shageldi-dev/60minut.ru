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

  const FilterDialog({
    super.key,
    this.result,
  });

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
    return ListenableBuilder(
        listenable: controller,
        builder: (BuildContext context, Widget? child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: white,
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                Expanded(
                  flex: 90,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: const Divider(),
                          ),
                          SizedBox(height: 8,),
                          FilterSegmentedButtons(
                            selected: widget.result?.priceType!
                                    .toJson()
                                    .entries
                                    .where((element) =>
                                        element.key == controller.priceType)
                                    .firstOrNull
                                    ?.value ??
                                "",
                            buttons: widget.result?.priceType!
                                    .toJson()
                                    .entries
                                    .map((e) => e.value.toString())
                                    .toList() ??
                                [],
                            onSelected: (p0, p1) {
                              controller.setPriceType(widget.result?.priceType!
                                  .toJson()
                                  .keys
                                  .elementAt(p1));
                            },
                          ),
                          FilterPrice(
                            result: widget.result,
                            from_value: controller.priceFrom ?? 0,
                            to_value: controller.priceTo ?? 0,
                            onFromChange: (p0) {
                              try {
                                controller.setPriceFrom(int.parse(p0));
                              } catch (e) {
                                controller.setPriceFrom(null);
                              }
                            },
                            onToChange: (p0) {
                              try {
                                controller.setPriceTo(int.parse(p0));
                              } catch (e) {
                                controller.setPriceTo(null);
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: const Divider(),
                          ),
                          const FilterSearch(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 19),
                            child: const Divider(),
                          ),
                          const FilterRating(),
                          FilterSegmentedButtons(
                            selected: "${controller.rating}",
                            buttons: widget.result!.rating!.keys
                                    .map((e) =>
                                        widget.result!.rating![e]!.toString())
                                    .toList() ??
                                [],
                            onSelected: (p0, p1) {
                              try {
                                controller.setRating(int.parse(p0));
                              } catch (e) {
                                controller.setRating(null);
                              }
                            },
                          ),
                          Padding(
                            padding: const  EdgeInsets.symmetric(horizontal: 19),
                            child: const Divider(),
                          ),
                          // MapEntry<String, Room>?  roomEntry = hotelDetails.rooms!.entries.elementAt(index);
                          // Room? room = roomEntry.value;
                          FilterButtons(
                            buttons: widget.result?.r!.keys
                                    .map((e) =>
                                        widget.result!.r![e]!.title!.toString())
                                    .toList() ??
                                [],
                            values: widget.result?.r!.keys.toList() ?? [],

                            // [
                            //   "Санузел",
                            //   "Душ",
                            //   "Ванна",
                            //   "Сауна",
                            //   "Халаты",
                            //   "Круглая кровать"
                            // ]
                          ),
                          Padding(
                            padding: const  EdgeInsets.symmetric(horizontal: 19),
                            child: const Divider(),
                          ),
                          KFilterButton(
                            buttons: widget.result?.h!
                                    .toJson()
                                    .entries
                                    .map((e) => e.value.toString())
                                    .toList() ??
                                [],
                            values:
                                widget.result?.h!.toJson().keys.toList() ?? [],
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
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            children: [
                              const Text(
                                'Найдено:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '${controller.allHotels.length}',
                                style: const TextStyle(
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
                          onClearClicked: () {
                            controller.clearFilter();
                          },
                          onOkClicked: () {
                            context.pop();
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
