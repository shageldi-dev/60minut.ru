import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/home/actions/SearchChip.dart';
import 'package:booking/ui/widget/home/actions/action_buttons.dart';
import 'package:booking/ui/widget/home/actions/metro_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectMetro extends StatelessWidget {
  SelectMetro({super.key, required this.controller});
  HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(listenable: controller, builder: (context, _){
      return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Card(
              child: Wrap(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(
                                  flex: 90,
                                  child: SizedBox(
                                    child: Text(
                                      'Метро',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF2F2F2F),
                                        fontSize: 24,
                                        fontFamily: 'MullerNarrow',
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: IconButton(
                                      onPressed: () => {context.pop()},
                                      icon: const Icon(
                                        Icons.close,
                                        color: iconColor,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            MetroDropdown(
                              controller: controller,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Wrap(children: List.generate(controller.selectedMetroList!.length,
                                    (index) =>    Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: SearchChip(text: "м. ${controller.selectedMetroList![index]}"),
                                )))
                            // Row(
                            //   children: [
                            //     SearchChip(text: "м. Марьино"),
                            //     SizedBox(
                            //       width: 12,
                            //     ),
                            //     SearchChip(text: "Рандеву Марьино"),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      ActionButtons(
                        onClearClicked: () {},
                        onOkClicked: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
