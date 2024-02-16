import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/features/home/models/filter_options.dart' as filter;
import 'package:flutter/material.dart';

///district
class FilterDropdownRegion extends StatelessWidget {
  const FilterDropdownRegion({super.key});
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Container(
            width: double.infinity,
            child: Card(
              elevation: 0,
              color: Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: DropdownButton(
                  value: controller.selecteDistrict,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  hint: Text(
                    'Выберите район',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2f2f2f),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (value) {
                    if (value is filter.Area) {
                      controller.addDistrict(value);
                      print(controller.selecteDistrictId);
                    }
                  },
                  underline: Container(),
                  items: controller.districtList!.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          value.name!,
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
        });
  }
}

class AddRatingDropDown extends StatefulWidget {
  final Function(String) onSelected;
  final List<String> list;
  const AddRatingDropDown(
      {super.key, required this.onSelected, required this.list});

  @override
  State<AddRatingDropDown> createState() => _AddRatingDropDownState();
}

class _AddRatingDropDownState extends State<AddRatingDropDown> {
  String selected = "";
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Container(
            width: double.infinity,
            child: Card(
              elevation: 0,
              color: Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: DropdownButton(
                  value: selected.isEmpty ? null : selected,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  hint: Text(
                    'Выберите район',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2f2f2f),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (value) {
                    setState(() {
                      selected = value!;
                    });
                    widget.onSelected(value!);
                  },
                  underline: Container(),
                  items: widget.list.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          value!,
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
        });
  }
}

///area
class FilterDropdownCity extends StatelessWidget {
  const FilterDropdownCity({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Container(
            width: double.infinity,
            child: Card(
              elevation: 0,
              color: Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: DropdownButton(
                  value: controller.selecteArea,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  hint: Text(
                    'Выберите город',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2f2f2f),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (value) {
                    if (value is filter.Area) {
                      controller.addArea(value);
                      print(controller.selectedAreaId);
                    }
                  },
                  underline: Container(),
                  items: controller.areaList!.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          value.name!,
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
        });
  }
}

class FilterDropdownMetro extends StatelessWidget {
  const FilterDropdownMetro({super.key});
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Container(
            width: double.infinity,
            child: Card(
              elevation: 0,
              color: Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: DropdownButton(
                  value: controller.selectedMetro,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  hint: Text(
                    'Выберите метро',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2f2f2f),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (value) {
                    if (value is filter.Metro) {
                      controller.selectMetroId(value);
                      print(controller.selectedFilterMetroId);
                    }
                  },
                  underline: Container(),
                  items: controller.metroList!.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          value.name!,
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
        });
  }
}

class FilterDropdownType extends StatelessWidget {
  FilterDropdownType({super.key});
  final List<String> items = ["Тип заведения", "Отель", "Апартаменты"];
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Container(
            width: double.infinity,
            child: Card(
              elevation: 0,
              color: Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: DropdownButton(
                  value: items[controller.type != null
                      ? int.parse(controller.type!)
                      : 0],
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  hint: Text(
                    'Тип заведения',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2f2f2f),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (value) {
                    if (value == "Тип заведения") {
                      controller.setType(null);
                    } else {
                      controller.setType("${items.indexOf(value!)}");
                    }
                  },
                  underline: Container(),
                  items: items!.map((value) {
                    return DropdownMenuItem(
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
        });
  }
}

class FilterDropdownShow extends StatefulWidget {
  FilterDropdownShow({super.key});

  @override
  State<FilterDropdownShow> createState() => _FilterDropdownShowState();
}

class _FilterDropdownShowState extends State<FilterDropdownShow> {
  String? selected = "Показывать";
  final List<String> items = ["Показывать", "Отели", "Номера"];

  final List<String?> values = [null, "hotels", "rooms"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (controller.show != null) {
      selected = items[values.indexOf(controller.show)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Container(
            width: double.infinity,
            child: Card(
              elevation: 0,
              color: Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: DropdownButton(
                  value: selected,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  hint: Text(
                    'Показывать',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2f2f2f),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (value) {
                    selected = value;
                    if (value == "Показывать") {
                      controller.setShow(null);
                    } else {
                      controller.setShow(values[items.indexOf(value!)]);
                    }
                  },
                  underline: Container(),
                  items: items!.map((value) {
                    return DropdownMenuItem(
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
        });
  }
}
