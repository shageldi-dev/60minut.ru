import 'package:booking/core/api_end_points.dart';
import 'package:booking/di.dart';
import 'package:booking/features/home/models/hotels.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/home/data/HomeController.dart';
import '../../theme/color.dart';
import '../../theme/typography.dart';
import 'home_list.dart';

class HomePartPage extends StatefulWidget {
  HomePartPage({super.key});
  @override
  State<HomePartPage> createState() => _HomePartPageState();
}
/// 32 - 64
class _HomePartPageState extends State<HomePartPage> {
  // final _controller = HomeController();

  @override
  void initState() {
    String path =
        locator<HomeController>().apiPath; //widget.controller.apiPath;
    if (path == ApiEndPoints.hotels) {
      path = ApiEndPoints.hotels;
    }
    if (path == ApiEndPoints.romantic) {
      path = ApiEndPoints.romantic;
    }
    controller.fetchHotels(path);
    controller.fetchShortFilters();

    super.initState();
  }

  Future<bool> _onWillPop() async {
    controller.fetchHotels(ApiEndPoints.hotels);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: WillPopScope(
        onWillPop: _onWillPop,
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
            ListenableBuilder(
                listenable: controller,
                builder: (BuildContext context, Widget? child) {
                  if (controller.hotelLoading) {
                    return const CircularProgressIndicator();
                  }
                  return HomeList(items: controller.filteredHotels);

                  // return HomeList(items: _controller.filteredHotels.sublist(0, _controller.filteredHotels.length));
                }),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => {
                    //context.go("/all")
                    context.push("/all")
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(grayDarkButton)),
                  child: const Text(
                    "Все отели",
                    style: TextStyle(
                        color: blackFont,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
