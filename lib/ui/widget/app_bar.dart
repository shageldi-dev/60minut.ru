import 'package:booking/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuClicked;
  const MyAppBar({super.key, required this.onMenuClicked});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      backgroundColor: white,
      title: SvgPicture.asset("assets/icons/Logo.svg", semanticsLabel: 'Acme Logo'),
      centerTitle: true,
      leading: Container(
        padding: const EdgeInsets.all(14),
        child: GestureDetector(
          onTap: () => {
            onMenuClicked()
          },
          child: SvgPicture.asset("assets/icons/menu.svg"),
        ),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap: () => {},
            child: SvgPicture.asset("assets/icons/heart.svg"),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
