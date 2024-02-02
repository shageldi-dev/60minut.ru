import 'package:booking/core/api_end_points.dart';
import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/widget/home/home_list.dart';
import 'package:flutter/material.dart';
import '../theme/typography.dart';

class AllHotelsPage extends StatefulWidget {
  const AllHotelsPage({super.key});

  @override
  State<AllHotelsPage> createState() => _AllHotelsPageState();
}

class _AllHotelsPageState extends State<AllHotelsPage> {
  final _controller = HomeController();

  @override
  void initState() {
    String path = ApiEndPoints.hotels;
    _controller.fetchHotels(path);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListenableBuilder(
        listenable: _controller,
        builder: (BuildContext context, Widget? child) {
          if (_controller.hotelLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Text(
                    "Мы нашли для вас ${_controller.hotel!.hotels!.length} отелей",
                    style: mullerNarrowStyle.copyWith(
                        fontWeight: FontWeight.w300, fontSize: 24)),
              ),
              HomeList(items: _controller.allHotels),
            ],
          );
        },
      ),
    );
  }
}
