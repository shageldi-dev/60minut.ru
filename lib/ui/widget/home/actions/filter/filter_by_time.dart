import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

class FilterByTime extends StatelessWidget {
  const FilterByTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 21,
          runSpacing: 12,
          children: controller.result!.suggest!.values!
              .map((e) => AppButton(removeAllHtmlTags("${e.title}"), () {
                    context.pop();
                    context.push(
                      "/filtered/${removeAllHtmlTags("${e.title}")}/${removeAllHtmlTags("${e.title}")}",
                    );
                  }))
              .toList()
          // [
          //   Text(
          //     'Часто ищут:',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 15,
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          //   AppButton("Недорогие до 700₽", () {
          //     context.pop();
          //     context.push(
          //       "/filtered/Недорогие до 700 ₽/Недорогие до 700 ₽",
          //     );
          //   }),
          //   AppButton("Люкс от 1200₽", () {
          //       context.pop();
          //     context.push(
          //       "/filtered/Люкс от 1200 ₽/Люкс от 1200 ₽",
          //     );
          //   }),
          //   AppButton("Номер на час", () {
          //      context.pop();
          //     context.push(
          //       "/filtered/Номер на час/Номер на час",
          //     );
          //   }),
          //   AppButton("С джакузи", () {}),
          //   AppButton("С сауной", () {}),
          //   AppButton("В центре", () {}),
          //   AppButton("Рядом с вокзалами", () {}),
          // ],
          ),
    );
  }
}

Widget AppButton(String text, void Function()? onPressed,
    {bool isSelected = false}) {
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              isSelected ? primaryColor : Color(0xFFF5F5F5))),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ));
}
