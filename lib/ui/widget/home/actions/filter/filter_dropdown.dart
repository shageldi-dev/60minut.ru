import 'package:booking/features/home/models/filter_options.dart';
import 'package:flutter/material.dart';

class FilterDropdownRegion extends StatefulWidget {
  final List<String> list;
  final void Function(String) callback;
  const FilterDropdownRegion({
    super.key,
    required this.list,
    required this.callback,
  });

  @override
  State<FilterDropdownRegion> createState() => _FilterDropdownRegionState();
}

class _FilterDropdownRegionState extends State<FilterDropdownRegion> {
  String? dropdownValue = null;
  FilterOptions? filterOptions;

  @override
  Widget build(BuildContext context) {
    // List<String> loanTypeModelList = loanMap.values.toList().cast<String>();
    // List<String> items = loanTypeModelList;
    //MapEntry<String, Area>? regionMap = filterOptions!.area!.entries.elementAt(index);
    // Metro? metro = metroEntry.value;
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: DropdownButton<String>(
            value: dropdownValue ?? widget.list.first,
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? value) {
              widget.callback(value!);
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            underline: Container(),
            items: widget.list.map<DropdownMenuItem<String>>((String value) {
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

class FilterDropdownCity extends StatefulWidget {
  final List<String> list;
  FilterDropdownCity({super.key, required this.list});

  @override
  State<FilterDropdownCity> createState() => _FilterDropdownCityState();
}

class _FilterDropdownCityState extends State<FilterDropdownCity> {
  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
            items: widget.list.map<DropdownMenuItem<String>>((String value) {
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

class FilterDropdownMetro extends StatefulWidget {
  final List<String> list;
  FilterDropdownMetro({super.key, required this.list});

  @override
  State<FilterDropdownMetro> createState() => _FilterDropdownMetroState();
}

class _FilterDropdownMetroState extends State<FilterDropdownMetro> {
  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
            items: widget.list.map<DropdownMenuItem<String>>((String value) {
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
