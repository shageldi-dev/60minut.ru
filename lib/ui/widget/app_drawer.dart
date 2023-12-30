import 'package:booking/ui/widget/drawer/drawer_button.dart';
import 'package:booking/ui/widget/drawer_dropdown.dart';
import 'package:booking/ui/widget/other/about.dart';
import 'package:booking/ui/widget/other/contact_us.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Drawer(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/icons/drawer_bg.png"),
              fit: BoxFit.fitWidth,
              repeat: ImageRepeat.repeatY),
          gradient: LinearGradient(
              colors: [
                Color(0xFFA83218),
                Color(0xFF484848),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [DrawerDropdown()],
                      )),
                  IconButton(
                    padding: const EdgeInsets.only(right: 16),
                      onPressed: () => {
                      context.pop()
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ))
                ],
              ),
              const AppDrawerButton(text: "ОТЕЛЬ МЕСЯЦА", image: "assets/icons/Cup.svg",),
              const AppDrawerButton(text: "НОМЕР МЕСЯЦА", image: "assets/icons/bed.svg",),
              const AppDrawerButton(text: "РОМАНТИКА", image: "assets/icons/HeartStatus.svg",),
              const AppDrawerButton(text: "ТОП-20",),
              const AppDrawerButton(text: "ВСЕ ОТЕЛИ",),
              AppDrawerButton(text: "КОНТАКТЫ", onClick: ()=>{
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  useRootNavigator: true,
                  builder: (BuildContext context) {
                    return AboutUs();
                  },
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(12))),
                )
              },),
              AppDrawerButton(text: "ОБРАТНАЯ СВЯЗЬ",onClick: ()=>{
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  useRootNavigator: true,
                  builder: (BuildContext context) {
                    return ContactUs();
                  },
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(12))),
                )
              },),
            ],
          ),
        ),
      )),
    );
  }
}
