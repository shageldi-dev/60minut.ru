import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_by_time.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_dropdown.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_segmented_buttons.dart';
import 'package:flutter/material.dart';

class FilterRating extends StatelessWidget {
  const FilterRating({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (BuildContext context, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FilterDropdownType(),
                      flex: 1,
                    ),
                    Expanded(
                      child: FilterDropdownShow(),
                      flex: 1,
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Wrap(
                  spacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    AppButton("Со скидками", () {
                      if (controller.withDiscount == null) {
                        controller.setWithDiscount(true);
                      } else {
                        controller.setWithDiscount(!controller.withDiscount!);
                      }
                    },
                        isSelected: controller.withDiscount != null &&
                            controller.withDiscount == true),
                    AppButton("Дизайнерские номера", () {
                      if (controller.isDesigner == null ||
                          controller.isDesigner == false) {
                        controller.setIsDesigner(true);
                      } else {
                        controller.setIsDesigner(false);
                      }
                    },
                        isSelected: controller.isDesigner != null &&
                            controller.isDesigner == true),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Рейтинг не ниже',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
