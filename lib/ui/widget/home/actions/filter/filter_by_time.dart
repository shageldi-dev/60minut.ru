import 'package:flutter/material.dart';

class FilterByTime extends StatelessWidget {
  const FilterByTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,

        spacing: 26,
        runSpacing: 12,
        children: [
          Text(
            'Часто ищут:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          AppButton("Недорогие до 700₽", () { }),
          AppButton("Люкс от 1200₽", () { }),
          AppButton("Номер на час", () { }),
          AppButton("С джакузи", () { }),
          AppButton("С сауной", () { }),
          AppButton("В центре", () { }),
          AppButton("Рядом с вокзалами", () { }),
        ],
      ),
    );
  }
}

Widget AppButton(String text, void Function()? onPressed) {
  return ElevatedButton(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFF5F5F5))),
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
