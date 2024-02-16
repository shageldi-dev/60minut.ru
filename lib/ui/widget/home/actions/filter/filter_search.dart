import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/home/actions/SearchChip.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterSearch extends StatefulWidget {
  const FilterSearch({super.key});

  @override
  State<FilterSearch> createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  String value = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (controller.q != null) {
      setState(() {
        value = controller.q ?? "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 2,
                left: 22,
                right: 22,
                bottom: 2,
              ),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(8),
                  )),
              child: TextField(
                controller: TextEditingController(text: value),
                keyboardType: TextInputType.text,
                onSubmitted: (v) {
                  value = v;
                  print(v);
                  if (v.trim().isEmpty) {
                    controller.setQ(null);
                  } else {
                    controller.setQ(v);
                  }
                },
                decoration: new InputDecoration(
                  icon: SvgPicture.asset("assets/icons/search.svg"),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Название, адрес, место, ориентир ...',
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: FilterDropdownRegion(),
                  flex: 1,
                ),
                Expanded(
                  child: FilterDropdownCity(),
                  flex: 1,
                ),
                Expanded(
                  child: FilterDropdownMetro(),
                  flex: 1,
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Wrap(
                children: List.generate(
                    controller.selectedMetroList!.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(6),
                          child: SearchChip(
                            text: "м. ${controller.selectedMetroList![index]}",
                            onRemove: (value) {
                              print(value);
                              controller.deleteMetroId(controller.metroList!
                                  .where((element) =>
                                      "м. ${element.name}" == value)
                                  .firstOrNull);
                            },
                          ),
                        ))),
            Wrap(
                children: List.generate(
                    controller.selectedAreaList!.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(6),
                          child: SearchChip(
                            text: "${controller.selectedAreaList![index]}",
                            onRemove: (value) {
                              print(value);
                              controller.deleteArea(controller.areaList!
                                  .where((element) => element.name == value)
                                  .firstOrNull);
                            },
                          ),
                        ))),
            Wrap(
                children: List.generate(
                    controller.selectedDistrictList!.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(6),
                          child: SearchChip(
                            text: "${controller.selectedDistrictList![index]}",
                            onRemove: (value) {
                              print(value);
                              controller.deleteDistrict(controller.districtList!
                                  .where((element) => element.name == value)
                                  .firstOrNull);
                            },
                          ),
                        ))),
          ],
        ),
      ),
    );
  }
}
