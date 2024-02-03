import 'package:booking/core/api_end_points.dart';
import 'package:booking/di.dart';
import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/page/like_page.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
 // final VoidCallback onMenuClicked;
  const MyAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      backgroundColor: white,
      title: GestureDetector(
          onTap: (){
            locator<HomeController>().fetchHotels(ApiEndPoints.hotels);
            context.go("/");
          },
          child: SvgPicture.asset("assets/icons/Logo.svg", semanticsLabel: 'Acme Logo')),
      centerTitle: true,
      leading: Container(
        padding: const EdgeInsets.all(14),
        child: GestureDetector(
          onTap: ()  {
            Scaffold.of(context).openDrawer();
          },
          child: SvgPicture.asset("assets/icons/menu.svg"),
        ),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LikePage()))
            },
            child: SvgPicture.asset("assets/icons/heart.svg"),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
