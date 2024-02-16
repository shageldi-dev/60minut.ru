import 'dart:async';

import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/features/home/models/filter_options.dart';
import 'package:booking/features/home/models/search_model.dart';
import 'package:booking/ui/page/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

// DropdownMenuEntry labels and values for the second dropdown menu.
enum IconLabel {
  smile('Метро', null, true),
  cloud('Марьино', "assets/icons/Metro.svg", false),
  rosha('Марьина Роща', "assets/icons/Metro.svg", false),
  brush('Отели', null, true),
  marino('Рандеву Марьино', null, false),
  heart('Результаты поиска', null, true),
  mar('Марьино', null, false);

  const IconLabel(this.label, this.icon, this.isCategory);

  final String label;
  final String? icon;
  final bool isCategory;
}

class AutocompleteSearch extends StatefulWidget {
  const AutocompleteSearch({super.key});

  @override
  State<AutocompleteSearch> createState() => _AutocompleteSearchState();
}

class _AutocompleteSearchState extends State<AutocompleteSearch> {
  Timer? _debounce;
  final TextEditingController iconController = TextEditingController();
  IconLabel? selectedIcon;
  int showedMetro = 0, showedRoom = 0, showedHotel = 0;
  // List<SearchResult> results = [];

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<SearchResult>(
      suggestionsCallback: (search) {
        showedMetro = 0;
        showedHotel = 0;
        showedRoom = 0;
        print(search);
        return controller.search(search);
      },
      emptyBuilder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Поиск не найден"),
        );
      },
      errorBuilder: (context, error) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Что-то пошло не так!"),
        );
      },
      builder: (context, controller, focusNode) {
        return TextField(
            controller: controller,
            focusNode: focusNode,
            onSubmitted: (value) {},
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Поиск',
            ));
      },
      itemBuilder: (context, city) {
        if (showedMetro == 1) {
          showedMetro = 2;
        }
        if (showedHotel == 1) {
          showedHotel = 2;
        }
        if (showedRoom == 1) {
          showedRoom = 2;
        }
        if (city.type == "metro") {
          showedMetro = showedMetro + 1;
        }
        if (city.type == "hotel") {
          showedHotel = showedHotel + 1;
        }
        if (city.type == "room") {
          showedRoom = showedRoom + 1;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (showedMetro == 1)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Метро",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            if (showedHotel == 1)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Отели",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            if (showedRoom == 1)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Номера",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            Row(
              children: [
                city.type == "metro"
                    ? Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: SvgPicture.asset(
                          "assets/icons/Metro.svg",
                          width: 14,
                          height: 14,
                        ),
                      )
                    : SizedBox(
                        width: 22,
                      ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (city.type == "room") {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                  id: "${city.hotel_id}",
                                )));
                      } else if (city.type == "hotel") {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                  id: "${city.id}",
                                )));
                      } else if (city.type == "metro") {
                        controller
                            .selectMetroId(Metro(id: city.id, name: city.name));
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 12, top: 20, bottom: 20),
                      child: Text(
                        city.title!,
                        style: TextStyle(
                          color: Color(0xFF2F2F2F),
                          fontSize: 15,
                          fontFamily: 'Averta CY',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
      onSelected: (city) {
        showedMetro = 0;
        showedHotel = 0;
        showedRoom = 0;
        print(city.hotel_id);
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return DropdownMenu<IconLabel>(
  //     width: MediaQuery.of(context).size.width - 60,
  //     controller: iconController,
  //     enableFilter: true,
  //     requestFocusOnTap: true,
  //     leadingIcon: const Icon(Icons.search),
  //     hintText: "Метро, округ, адрес или отель",
  //     inputDecorationTheme: const InputDecorationTheme(
  //         filled: true,
  //         contentPadding: EdgeInsets.symmetric(vertical: 5.0),
  //         fillColor: Colors.transparent,
  //         border: OutlineInputBorder()),
  //     onSelected: (IconLabel? icon) {
  //       setState(() {
  //         selectedIcon = icon;
  //       });
  //     },
  //     dropdownMenuEntries: IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
  //       (IconLabel icon) {
  // return DropdownMenuEntry<IconLabel>(
  //     value: icon,
  //     label: icon.label,
  //     leadingIcon: icon.icon != null
  //         ? Padding(
  //             padding: const EdgeInsets.only(left: 22),
  //             child: Text(
  //               "м.",
  //               style: TextStyle(
  //                 color: Color(0xFF6DAF27),
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w400,
  //               ),
  //             ),
  //           )
  //         : icon.isCategory
  //             ? Container()
  //             : SizedBox(
  //                 width: 22,
  //               ),
  //     style: ButtonStyle(
  //         textStyle: MaterialStateProperty.all(icon.isCategory
  //             ? TextStyle(
  //                 color: Color(0xFF2F2F2F),
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w700,
  //               )
  //             : TextStyle(
  //                 color: Color(0xFF2F2F2F),
  //                 fontSize: 15,
  //                 fontFamily: 'Averta CY',
  //                 fontWeight: FontWeight.w400,
  //                 height: 0,
  //               ))));
  //       },
  //     ).toList(),
  //   );
  // }
}
