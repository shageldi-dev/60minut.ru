import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeActionButton extends StatelessWidget {
  final String icon;
  final VoidCallback onClick;

  const HomeActionButton({Key? key, required this.icon, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Color(0x0A000000), spreadRadius: 3, blurRadius: 5),
          ],
        ),
        height: 50,
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
