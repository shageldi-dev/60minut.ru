import 'dart:math';

import 'package:booking/core/api_params.dart';
import 'package:booking/features/home/models/hotels.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ItemWidget extends StatelessWidget {
  final Hotels hotel;
  const ItemWidget({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    var isLiked = Random().nextBool();
    return GestureDetector(
      onTap: ()=>{
        context.push("/details")
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                height: 140,
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: CachedNetworkImage(
                      width: 120,
                      height: 140,
                      imageUrl:
                          "${IMG_BASE_URL}${hotel.img}",
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
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 38,
                        height: 38,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6)),
                            color:
                                hotel.favorite!=null && hotel.favorite!=1 ? redColor : Colors.black.withOpacity(0.5)),
                        child: SvgPicture.asset("assets/icons/heart.svg",
                            color: Colors.white),
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
                      "${hotel.name}",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/icons/Metro.svg", color: const Color(0xFF8C8C8C),),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${hotel.metroName}",
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: blackFont),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${hotel.walk} мин",
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,color: grayFont),
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
                            Text(
                              "от",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,color: blackFont),
                              maxLines: 1,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "${hotel.price}",
                              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22,color: blackFont),
                              maxLines: 1,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "₽/${hotel.priceTypeText}",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,color: blackFont),
                              maxLines: 1,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "от ${hotel.minHour} ч",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,color: primaryColor),
                              maxLines: 1,
                            ),
                          ],
                        ),
                        GestureDetector(
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            elevation: 0,
                            color: grayLightButton,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Icon(Icons.phone_enabled_outlined),
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
    );
  }
}
