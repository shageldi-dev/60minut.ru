import 'package:booking/features/home/models/detail_model.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/home/actions/action_buttons.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_by_time.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_price.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_segmented_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RoomFilter extends StatefulWidget {
  final HotelDetails hotelDetails;
  final String count;
  final Function(String, String, String, List<String>) onFiltered;
  const RoomFilter(
      {super.key,
      required this.hotelDetails,
      required this.onFiltered,
      required this.count});

  @override
  State<RoomFilter> createState() => _RoomFilterState();
}

class _RoomFilterState extends State<RoomFilter> {
  String price_type = "";
  String price_f = "0";
  String price_t = "0";
  List<String> services = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 85,
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 90,
                          child: Text(
                            'Фильтр по номерам',
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
                  FilterSegmentedButtons(
                    selected: "",
                    buttons: ["1 ч", "3 ч", "Ночь", "Сутки"],
                    onSelected: (value, index) {
                      const values = [
                        "hour_price",
                        "hour_3_price",
                        "night_price",
                        "day_price",
                      ];
                      setState(() {
                        price_type = values[index];
                      });
                      Future.delayed(const Duration(milliseconds: 500), () {
                        widget.onFiltered(
                            price_type, price_f, price_t, services);
                      });
                    },
                  ),
                  FilterPrice(
                    from_value: 0,
                    to_value: 0,
                    onFromChange: (p0) {
                      setState(() {
                        price_f = p0;
                      });
                    },
                    onToChange: (p0) {
                      setState(() {
                        price_t = p0;
                      });
                      Future.delayed(const Duration(milliseconds: 500), () {
                        widget.onFiltered(
                            price_type, price_f, price_t, services);
                      });
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 10,
                          children: widget
                              .hotelDetails.roomOptions!.options!.values
                              .map((e) => AppIconButton("${e.title}",
                                      "assets/features/ico-${e.ico}.svg", () {
                                    setState(() {
                                      if (services.contains(widget.hotelDetails
                                          .roomOptions!.options!.entries
                                          .firstWhere((element) =>
                                              element.value.title == e.title)
                                          .key)) {
                                        services = services
                                            .where((element) =>
                                                element !=
                                                widget.hotelDetails.roomOptions!
                                                    .options!.entries
                                                    .firstWhere((element) =>
                                                        element.value.title ==
                                                        e.title)
                                                    .key)
                                            .toList();
                                      } else {
                                        services = [
                                          ...services,
                                          widget.hotelDetails.roomOptions!
                                              .options!.entries
                                              .firstWhere((element) =>
                                                  element.value.title ==
                                                  e.title)
                                              .key
                                        ];
                                      }
                                    });
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      widget.onFiltered(price_type, price_f,
                                          price_t, services);
                                    });
                                  },
                                      services.contains(widget.hotelDetails
                                          .roomOptions!.options!.entries
                                          .firstWhere((element) =>
                                              element.value.title == e.title)
                                          .key)))
                              .toList()),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 60,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 15,
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
                          widget.count,
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
                    onClearClicked: () {
                      setState(() {
                        price_type = "";
                        price_f = "";
                        price_t = "";
                        services = [];
                      });
                      context.pop();
                      widget.onFiltered("", "", "", []);
                    },
                    onOkClicked: () {
                      context.pop();
                      widget.onFiltered(price_type, price_f, price_t, services);
                    },
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

Widget AppIconButton(
    String text, String icon, void Function()? onPressed, bool selected) {
  return FittedBox(
    child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                selected ? const Color(0xFFFFA6A8) : const Color(0xFFF5F5F5))),
        onPressed: onPressed,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        )),
  );
}
