import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/home/data/HomeController.dart';
import '../../theme/color.dart';
import '../../theme/typography.dart';
import 'home_list.dart';

class HomePart extends StatefulWidget {



  const HomePart({super.key});

  @override
  State<HomePart> createState() => _HomePartState();
}

class _HomePartState extends State<HomePart> {
  final _controller = HomeController();

  @override
  void initState() {
    _controller.fetchHotels();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text("Гостиницы и отели на час",
                    style: mullerNarrowStyle.copyWith(
                        fontWeight: FontWeight.w300, fontSize: 24)),
              ),
              const SizedBox(
                height: 16,
              ),
              ListenableBuilder(listenable: _controller, builder: (BuildContext context, Widget? child){
                if(_controller.hotelLoading){
                  return CircularProgressIndicator();
                }
                return  HomeList(items: _controller.hotel!.hotels!.sublist(0, 20));
              }),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => {
                      context.push("/all")
                    },
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(grayDarkButton)),
                    child: const Text(
                      "Все отели",
                      style: TextStyle(color: blackFont, fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
