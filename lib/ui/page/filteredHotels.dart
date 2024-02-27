import 'package:booking/core/api_end_points.dart';
import 'package:booking/core/custom_log_interceptor.dart';
import 'package:booking/features/home/models/hotels.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/theme/typography.dart';
import 'package:booking/ui/widget/top20_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/home/data/HomeController.dart';

class FilteredHotelsPage extends StatefulWidget {
  final String title;
  final String id;
  const FilteredHotelsPage({super.key, required this.title, required this.id});

  @override
  State<FilteredHotelsPage> createState() => _FilteredHotelsPageState();
}

class _FilteredHotelsPageState extends State<FilteredHotelsPage> {
  bool loading = true;

  @override
  void initState() {
    setState(() {
      loading = true;
    });
    controller.getFilteredHotels((result) {
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(widget.title,
                style: mullerNarrowStyle.copyWith(
                    fontWeight: FontWeight.w300, fontSize: 24)),
          ),
          const SizedBox(
            height: 16,
          ),
          ListenableBuilder(
              listenable: controller,
              builder: (BuildContext context, Widget? child) {
                if (loading) {
                  return const CircularProgressIndicator();
                }
                return Top20List(
                  items: controller.filteredHotels!.collections!.values
                      .firstWhere((element) => element.title == widget.title)
                      .rooms!
                      .values
                      .toList(),
                );
              }),
        ],
      ),
    );
  }
}
