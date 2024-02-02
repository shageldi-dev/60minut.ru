import 'package:booking/core/api_end_points.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/theme/typography.dart';
import 'package:booking/ui/widget/top20_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/home/data/HomeController.dart';

class Top20tPage extends StatefulWidget {
  const Top20tPage({super.key});

  @override
  State<Top20tPage> createState() => _Top20tPageState();
}

class _Top20tPageState extends State<Top20tPage> {
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
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("ТОП-20",
                style: mullerNarrowStyle.copyWith(
                    fontWeight: FontWeight.w300, fontSize: 24)),
          ),
          const SizedBox(
            height: 16,
          ),
          ListenableBuilder(
              listenable: _controller,
              builder: (BuildContext context, Widget? child) {
                if (_controller.hotelLoading) {
                  return const CircularProgressIndicator();
                }
                return Top20List(items: _controller.allHotels.sublist(0, 20));
              }),
        ],
      ),
    );
  }
}
