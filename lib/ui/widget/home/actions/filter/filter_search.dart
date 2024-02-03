import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/home/actions/SearchChip.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterSearch extends StatelessWidget {
  const FilterSearch({super.key, required this.controller});
 final HomeController controller;

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
                keyboardType: TextInputType.text,
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
                  child: FilterDropdownRegion(
                    controller: controller,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: FilterDropdownCity(
                    controller: controller,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: FilterDropdownMetro(
                    controller: controller,
                  ),
                  flex: 1,
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            if (controller.selecteArea!=null || controller.selecteDistrict!=null || controller.selectedMetro!=null)
            Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 12,
              children: [
                controller.selecteArea!=null ?   SearchChip(text: controller.selecteArea!.name!) :Container(),
                controller.selecteDistrict!=null ?   SearchChip(text: controller.selecteDistrict!.name!) : Container(),

                controller.selectedMetro!=null ?  SearchChip(text: "м. ${controller.selectedMetro!.name!}") : Container(),
              ],
            )else
              Container(),
          ],
        ),
      ),
    );
  }
}
