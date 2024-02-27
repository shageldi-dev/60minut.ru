import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/features/home/models/filter_options.dart';
import 'package:booking/ui/widget/buttons.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_by_time.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'actions/filter/filter_dialog.dart';

/// 30 -33
class ShortFilter extends StatefulWidget {
  const ShortFilter({super.key});

  @override
  State<ShortFilter> createState() => _ShortFilterState();
}

class _ShortFilterState extends State<ShortFilter> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ...["до 700","На час","С джакузи","Еще"].map((element) =>  FilledButton(
            //   onPressed: () {},
            //   style: ButtonStyle(
            //       shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
            //       backgroundColor: MaterialStateProperty.all(const Color(0xFFE3E3E3))
            //   ), child: Text(element, style: const TextStyle(color: Colors.black, fontSize: 15),),
            // )).toList(),
            AppButton("до 700", () {
              context.push(
                "/filtered/Недорогие до 700 ₽/Недорогие до 700 ₽",
              );
            }),
            AppButton("На час", () {
              context.push(
                "/filtered/Номер на час/Номер на час",
              );
            }),
            AppButton("С джакузи", () {
              context.push(
                "/filtered/С джакузи/С джакузи",
              );
            }),
            AppButton("Еще", () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      FilterDialog(result: controller.result));
            }),
          ],
        ),
      ),
    );
  }
}
