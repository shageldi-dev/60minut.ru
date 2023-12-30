import 'package:booking/ui/widget/home/actions/action_buttons.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_by_time.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_price.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_segmented_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RoomFilter extends StatefulWidget {
  const RoomFilter({super.key});

  @override
  State<RoomFilter> createState() => _RoomFilterState();
}

class _RoomFilterState extends State<RoomFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 88,
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(child:Text(
                          'Фильтр по номерам',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF2F2F2F),
                            fontSize: 24,
                            fontFamily: 'MullerNarrow',
                            fontWeight: FontWeight.w800,
                          ),
                        ), flex: 90,),
                        GestureDetector(child: Expanded(child: Icon(Icons.close),flex: 10,), onTap: ()=>{context.pop()},)
                      ],
                    ),
                  ),
                  const FilterSegmentedButtons(buttons: ["1 ч","3 ч","Ночь","Сутки"]),
                  FilterPrice(),
                  Padding(
                    padding: const EdgeInsets.only(left: 6,right: 6),
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 10,
                      children: [
                        AppIconButton("Санузел", "assets/icons/search.svg", () { }),
                        AppIconButton("Минибар", "assets/icons/search.svg", () { }),
                        AppIconButton("Сану", "assets/icons/search.svg", () { }),
                        AppIconButton("Санузел", "assets/icons/search.svg", () { }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Align(
              child:   Expanded(child: Container(
                height: 60,
                decoration: BoxDecoration(color: Color(0xB2454545)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(children: [
                        Text(
                          'Найдено:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 6,),
                        Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'MullerNarrow',
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],),
                    ),
                    ActionButtons(backgroundColor: Colors.transparent,)
                  ],
                ),
              ),flex: 10,),
            ),
          )
        ],
      ),
    );
  }
}

Widget AppIconButton(String text, String icon, void Function()? onPressed) {
  return FittedBox(
    child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFF5F5F5))),
        onPressed: onPressed,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 6,),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        )),
  );
}
