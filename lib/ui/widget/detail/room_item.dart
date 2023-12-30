import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/detail/ImagePager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoomItem extends StatefulWidget {
  const RoomItem({super.key});

  @override
  State<RoomItem> createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {
  int _currentPage = 0;

  void setCurrentPage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            ImagePager(images: ["",""], onPageChange: (page)=>{
              setCurrentPage(page)
            },controller: controller,),
            Align(
              alignment: Alignment.topRight,
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  width: 56,
                  height: 38,
                  alignment: Alignment.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6), topRight:  Radius.circular(12)),
                    ),
                  ),
                  child: Text(
                    '$_currentPage / 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 100, right: 12),
                child: GestureDetector(
                  onTap: ()=>{
                    controller.animateToPage((controller.page!.round()+1), duration: Durations.long1, curve: Curves.linear)
                  },
                  child: Opacity(
                    opacity: 0.70,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Icon(Icons.keyboard_arrow_right, color: white,),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 12),
                child: GestureDetector(
                  onTap: ()=>{
                    controller.animateToPage((controller.page!.round()-1), duration: Durations.long1, curve: Curves.linear)
                  },
                  child: Opacity(
                    opacity: 0.70,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Icon(Icons.keyboard_arrow_left, color: white,),
                    ),
                  ),
                ),
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Стандарт',
                  style: TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 24,
                    fontFamily: 'MullerNarrow',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Text(
                      '333 ₽',
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      '1 ч',
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  children: [
                    Text(
                      '1000 ₽',
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      '3 ч',
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/bed.svg", color: Color(0xFF9E9E9E),width: 20, height: 20,),
                    SizedBox(width: 10,),
                    SvgPicture.asset("assets/icons/bed.svg", color: Color(0xFF9E9E9E),width: 20, height: 20,),
                    SizedBox(width: 10,),
                  ],
                ),
                SizedBox(height: 12,),
                Text(
                  'Круглосуточное заселение',
                  style: TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF555A),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      ),
                      child: Text(
                        'от 3ч',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 8,)
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 9,
                      left: 10,
                      right: 10,
                      bottom: 11,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Icon(Icons.phone_enabled, color: Colors.white,),
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-0.71, -0.71),
                        end: Alignment(0.71, 0.71),
                        colors: [Color(0xFF339E9E), Color(0xFF307E7D)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
