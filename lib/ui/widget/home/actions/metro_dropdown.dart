import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Москва и МО',
  'Москва и МО 1',
  'Москва и МО 2',
  'Москва и МО 3'
];

class MetroDropdown extends StatefulWidget {
  const MetroDropdown({super.key});

  @override
  State<MetroDropdown> createState() => _MetroDropdownState();
}

class _MetroDropdownState extends State<MetroDropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color:  Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
          child: DropdownButton<String>(
            value: dropdownValue,
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            underline: Container(),
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  width: 150,
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2f2f2f),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
