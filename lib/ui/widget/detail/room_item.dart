import 'package:booking/core/api_params.dart';
import 'package:booking/features/home/models/detail_model.dart';
import 'package:booking/features/home/models/hotel_details/hotel_details.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/detail/ImagePager.dart';
import 'package:booking/utils/call/call.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:shimmer/shimmer.dart';

class RoomItem extends StatefulWidget {
  Room roomModel;
  int index;
  final HotelDetails hotelDetails;
  RoomItem({
    super.key,
    required this.roomModel,
    required this.index,
    required this.hotelDetails,
  });

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
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            ExpandablePageView.builder(
              itemCount: widget.roomModel.images!.length,
              controller: controller,
              onPageChanged: (page) => {setCurrentPage(page)},
              itemBuilder: (context, indexx) {
                return PinchZoom(
                  maxScale: 2.5,
                  onZoomStart: () {},
                  onZoomEnd: () {},
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: 250,
                    imageUrl:
                        "$IMG_BASE_URL${widget.roomModel.images![widget.roomModel.images!.keys.elementAt(indexx)]!.img}",
                    //  "https://picsum.photos/250?image=${Random().nextInt(100)}",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white38,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                );
              },
            ),
            // ImagePager(
            //   //images: const ["",""],
            //   images: [widget.roomModel.images![widget.index].img!],
            //   //"$IMG_BASE_URL${widget.roomModel.images![widget.index].img}",
            //   onPageChange: (page)=>{
            //   setCurrentPage(page)
            // },controller: controller,),
            Align(
              alignment: Alignment.topRight,
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  width: 56,
                  height: 38,
                  alignment: Alignment.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: const ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(6),
                          topRight: Radius.circular(12)),
                    ),
                  ),
                  child: Text(
                    '${_currentPage + 1} / ${widget.roomModel.images!.length}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 100, right: 12),
                child: GestureDetector(
                  onTap: () => {
                    controller.animateToPage((controller.page!.round() + 1),
                        duration: const Duration(microseconds: 500),
                        curve: Curves.linear)
                  },
                  child: Opacity(
                    opacity: 0.70,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_right,
                        color: white,
                      ),
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
                  onTap: () => {
                    controller.animateToPage((controller.page!.round() - 1),
                        duration: const Duration(microseconds: 500),
                        curve: Curves.linear)
                  },
                  child: Opacity(
                    opacity: 0.70,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_left,
                        color: white,
                      ),
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
                  widget.roomModel.name ?? '',
                  style: const TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 24,
                    fontFamily: 'MullerNarrow',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      '${widget.roomModel.hourPrice!}p'?? '',
                      //widget.roomModel.hourPrice![widget.index] !=null ?widget.roomModel.hourPrice![widget.index] ??'':"",
                      style: const TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '1 ч',
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      '${widget.roomModel.hour3Price}p' ?? '',
                      style: const TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                     Text(
                      '3 ч',
                      style: const TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(height:   widget.roomModel.nightPrice != '0' ? 6 : 0),
                widget.roomModel.nightPrice != '0' ? Row(
                  children: [
                    Text(
                      '${widget.roomModel.nightPrice!}p' ?? '',
                      //widget.roomModel.hourPrice![widget.index] !=null ?widget.roomModel.hourPrice![widget.index] ??'':"",
                      style: const TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'ночь с 21:00 до 10',
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ) : Container(),
                SizedBox(height:  widget.roomModel.dayPrice != '0' ? 6 : 0),
                widget.roomModel.dayPrice != '0' ?   Row(
                  children: [
                    Text(
                      '${widget.roomModel.dayPrice!}p' ?? '',
                      //widget.roomModel.hourPrice![widget.index] !=null ?widget.roomModel.hourPrice![widget.index] ??'':"",
                      style: const TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'сутки',
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ) : Container(),
                const SizedBox(
                  height: 12,
                ),
                Wrap(
                  spacing: 12,
                  children: widget.hotelDetails.roomOptions!.options!.entries
                      .where((element) {
                        return widget.roomModel
                            .toMap()!
                            .entries
                            .where((e) => e.value == "1")
                            .map((e) => e.key)
                            .contains(element.key);
                      })
                      .map((e) => SvgPicture.asset(
                            "assets/features/ico-${e.value.ico}.svg",
                            color: const Color(0xFF9E9E9E),
                            width: 20,
                            height: 20,
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  '${widget.roomModel.images!.keys.map((e) => widget.roomModel.images![e]!.title)}' ??
                      'Круглосуточное заселение',
                  style: const TextStyle(
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
                      padding: const EdgeInsets.all(3),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFF555A),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child:  Text(
                        'от ${widget.roomModel.minBooking} ч',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      makePhoneCall(
                          "${widget.hotelDetails.hotel!.phone}", context);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 9,
                        left: 10,
                        right: 10,
                        bottom: 11,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: const Icon(
                        Icons.phone_enabled,
                        color: Colors.white,
                      ),
                      decoration: const ShapeDecoration(
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
