import 'dart:ffi';

import 'package:flutter/material.dart';

class ShortFilter extends StatefulWidget {
  const ShortFilter({super.key});

  @override
  State<ShortFilter> createState() => _ShortFilterState();
}

class _ShortFilterState extends State<ShortFilter> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...["до 700","На час","С джакузи","Еще"].map((element) =>  FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                  backgroundColor: MaterialStateProperty.all(const Color(0xFFE3E3E3))
              ), child: Text(element, style: const TextStyle(color: Colors.black, fontSize: 15),),
            )).toList(),
          ],
        ),
      ),
    );
  }
}
