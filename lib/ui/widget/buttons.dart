import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  const MainButton({super.key, required this.element, required this.press});
  final String element;
  final Function press;

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.press();
      },
      child: FilledButton(
        onPressed: () {
          widget.press();
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
            backgroundColor:
                MaterialStateProperty.all(const Color(0xFFE3E3E3))),
        child: Text(
          widget.element,
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
