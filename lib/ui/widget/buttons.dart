
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key,required this.element, required this.press});
final String element;
final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: press,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
          backgroundColor: MaterialStateProperty.all(const Color(0xFFE3E3E3))
      ), child: Text(element, style: const TextStyle(color: Colors.black, fontSize: 15),),
    );
  }
}
