
import 'package:booking/core/api_params.dart';
import 'package:booking/core/sqlite_service.dart';
import 'package:booking/features/home/models/favorites.dart';
import 'package:booking/features/home/models/hotels.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/utils/call/call.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ItemWidget extends StatefulWidget {
  final Hotels hotel;
  const ItemWidget({super.key, required this.hotel});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final dbHelper = DatabaseHelper();
  var isLiked = false;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance?.addObserver(this);
    try {
      dbHelper.isFavoriteById(int.parse(widget.hotel.hotelId!)).then((value) {
        setState(() {
          isLiked = value;
        });
      });
    } catch (e) {}
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);

  //   print("State" + state.name);

  //   if (state == AppLifecycleState.resumed) {
  //     print("App resumed");
  //   }
  // }

  Future<void> _toggleFavorite(Favorite fav) async {
    if (await dbHelper.isFavoriteById(fav.hotelId)) {
      await dbHelper.deleteFavorite(fav.hotelId);
      setState(() {
        isLiked = false;
      });
    } else {
      await dbHelper.addFavorite(fav);
      setState(() {
        isLiked = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        context.pop(),
        context.push("/details/${widget.hotel.id}"),
        print(widget.hotel.id! + '---------------------------------------------')
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(right: 16),//have to be 0
          child: SizedBox(
            height: 140,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 125,//120,
                  height: 140,
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: CachedNetworkImage(
                        width: 120,
                        height: 140,
                        imageUrl: "${IMG_BASE_URL}${widget.hotel.img}",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => SizedBox(
                          width: 120,
                          height: 140,
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
                      )),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            _toggleFavorite(widget.hotel.toFavorite());
                          },
                          child: Container(
                            width: 38,
                            height: 38,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    bottomRight: Radius.circular(6)),
                                color: isLiked
                                    ? redColor
                                    : Colors.black.withOpacity(0.5)),
                            child: SvgPicture.asset("assets/icons/heart.svg",
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "${widget.hotel.name}",
                        style:
                            const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Metro.svg",
                            color: const Color(0xFF8C8C8C),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${widget.hotel.metroName}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: blackFont),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "${widget.hotel.walk} мин",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: grayFont),
                            maxLines: 1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "от",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: blackFont),
                                maxLines: 1,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "${widget.hotel.price}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 22,
                                    color: blackFont),
                                maxLines: 1,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "₽/${widget.hotel.priceTypeText}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: blackFont),
                                maxLines: 1,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "от ${widget.hotel.minHour ?? ''} ч",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: primaryColor),
                                maxLines: 1,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.hotel.phone != null
                                  ? makePhoneCall(widget.hotel.phone!, context)
                                  : () {};
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              elevation: 0,
                              color: grayLightButton,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: const Icon(Icons.phone_enabled_outlined),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
