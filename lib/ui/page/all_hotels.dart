import 'package:flutter/material.dart';

import '../theme/typography.dart';
import '../widget/item/item_widget.dart';

class AllHotels extends StatefulWidget {
  final List<String> items;
  const AllHotels({super.key, required this.items});

  @override
  State<AllHotels> createState() => _AllHotelsState();
}



class _AllHotelsState extends State<AllHotels> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text("Мы нашли для вас 139 отелей",
              style: mullerNarrowStyle.copyWith(
                  fontWeight: FontWeight.w300, fontSize: 24)),
        ),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: widget.items.length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         title: ItemWidget(),
        //       );
        //     },
        //   ),
        // )
      ],
    );
  }
}
