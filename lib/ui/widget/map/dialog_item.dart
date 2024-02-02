import 'package:booking/core/api_params.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/utils/call/call.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class DialogItem extends StatelessWidget {
  DialogItem({super.key,
  required  this.image,
    required this.favorite,
    required   this.name,
    required this.metroName,
    required this.walk,
    required this.price,
    required  this.priceTypeText,
    required  this.minHour,
    required this.phoneNumber
  }
  );

  String image;
  int? favorite;
  String name;
  String metroName;
  int walk;
  String price;
  String priceTypeText;
  String minHour;
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
       // padding: const EdgeInsets.only(right: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 125,
              height: 140,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: CachedNetworkImage(
                    width: 125,
                    height: 140,
                    imageUrl: "${IMG_BASE_URL}${image}",
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
                      width: 125,
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
                          color: favorite != null && favorite != 1
                              ? redColor
                              : Colors.black.withOpacity(0.5)),
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
                    name,
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
                      SvgPicture.asset(
                        "assets/icons/Metro.svg",
                        color: const Color(0xFF8C8C8C),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${metroName ?? ''}",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: blackFont),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "${walk ?? ''} мин",
                        style: TextStyle(
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
                          Text(
                            "от",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: blackFont),
                            maxLines: 1,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "${price}" ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 22,
                                color: blackFont),
                            maxLines: 1,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "₽/${priceTypeText}" ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: blackFont),
                            maxLines: 1,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "от ${minHour ?? ''} ч",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: primaryColor),
                            maxLines: 1,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          makePhoneCall(phoneNumber,context);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
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
    );
  }
}
