import 'package:booking/features/home/models/hotels.dart';
import 'package:flutter/material.dart';

import 'item/item_widget.dart';

class MesyasOtelList extends StatelessWidget {
  final List<Hotels?> items;
  const MesyasOtelList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: ItemWidget(
            hotel: items[index]!,
            isRoom: false,
          ),
        );
      },
    );
  }
}
