
import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/features/home/models/filter_options.dart';
import 'package:booking/ui/widget/buttons.dart';
import 'package:flutter/material.dart';

import 'actions/filter/filter_dialog.dart';
/// 30 -33
class ShortFilter extends StatelessWidget {
  const ShortFilter({super.key, required this.controller});

 // final void Function(String) onPressed;
 final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16),
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
            MainButton(element: 'до 700', press: () => controller.onShortFilterPressed(0)),
            MainButton(element: 'На час', press: () =>  controller.onShortFilterPressed(1)),
            MainButton(element: 'С джакузи', press: () => controller.onShortFilterPressed(2)),
            MainButton(element: 'Еще', press: () => (){}),
          ],
        ),
      ),
    );
  }
}

