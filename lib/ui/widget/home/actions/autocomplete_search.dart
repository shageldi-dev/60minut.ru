import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// DropdownMenuEntry labels and values for the second dropdown menu.
enum  IconLabel {
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
  final TextEditingController iconController = TextEditingController();
  IconLabel? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<IconLabel>(
      width: MediaQuery.of(context).size.width - 60,
      controller: iconController,
      enableFilter: true,
      requestFocusOnTap: true,
      leadingIcon: const Icon(Icons.search),
      hintText: "Метро, округ, адрес или отель",
      inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
          fillColor: Colors.transparent,
          border: OutlineInputBorder()),
      onSelected: (IconLabel? icon) {
        setState(() {
          selectedIcon = icon;
        });
      },
      dropdownMenuEntries: IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
        (IconLabel icon) {
          return DropdownMenuEntry<IconLabel>(
              value: icon,
              label: icon.label,
              leadingIcon:
                  icon.icon != null ? Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Text("м.", style: TextStyle(
                      color: Color(0xFF6DAF27),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),),
                  ) : icon.isCategory?Container():SizedBox(width: 22,),
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(icon.isCategory
                      ? TextStyle(
                          color: Color(0xFF2F2F2F),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        )
                      : TextStyle(
                          color: Color(0xFF2F2F2F),
                          fontSize: 15,
                          fontFamily: 'Averta CY',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ))));
        },
      ).toList(),
    );
  }
}
