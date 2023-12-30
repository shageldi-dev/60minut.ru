import 'dart:math';

import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/app_bar.dart';
import 'package:booking/ui/widget/detail/add_rating.dart';
import 'package:booking/ui/widget/detail/filter/room_filter.dart';
import 'package:booking/ui/widget/detail/ratings.dart';
import 'package:booking/ui/widget/detail/room_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../widget/app_drawer.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    TextStyle defaultStyle = const TextStyle(
      color: Color(0xFF2F2F2F),
      fontSize: 15,
      fontWeight: FontWeight.w400,
    );
    TextStyle linkStyle = const TextStyle(
      color: Color(0xFF2F2F2F),
      fontSize: 15,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    );
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(color: Color(0xB2454545).withOpacity(0.5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 9,
                left: 14,
                right: 13,
                bottom: 11,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Color(0xFF54BB6A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/whatsapp.svg",
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'WhatsApp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 9,
                left: 14,
                right: 13,
                bottom: 11,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Позвоните мне',
                    style: TextStyle(
                      color: Color(0xFF2F2F2F),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(grayLightButton)),
                    child: Row(children: [
                      Icon(
                        Icons.arrow_back_sharp,
                        color: blackColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "К списку",
                        style: TextStyle(color: blackColor),
                      )
                    ]),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(grayLightButton)),
                      onPressed: () => {},
                      child: SvgPicture.asset("assets/icons/heart.svg")),
                  ElevatedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(grayLightButton)),
                    child: Row(children: [
                      Icon(
                        Icons.arrow_downward,
                        color: blackColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Номера",
                        style: TextStyle(color: blackColor),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Отель",
                        style: TextStyle(
                          fontFamily: "MullerNarrow",
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          color: Color(0xffe50914),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Ампир",
                        style: TextStyle(
                          fontFamily: "MullerNarrow",
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff2f2f2f),
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  CachedNetworkImage(
                    width: 80,
                    height: 80,
                    imageUrl:
                        "https://picsum.photos/250?image=${Random().nextInt(100)}",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
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
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: ShapeDecoration(
                  color: Color(0xFFFF555A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'АКЦИЯ! В будни 3 часа + 1 час в подарок = 1000 руб. *Действует в промежуток с 12:00 до 16:00, кроме пт, сб и вс.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Metro.svg",
                    color: Color(0xFF7CBE37),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Печатники',
                    style: TextStyle(
                      color: Color(0xFF2F2F2F),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '14 мин',
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 6),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Metro.svg",
                    color: Color(0xFF7CBE37),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Люблино',
                    style: TextStyle(
                      color: Color(0xFF2F2F2F),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '14 мин',
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: RichText(
                          text: TextSpan(style: defaultStyle, children: [
                        TextSpan(
                            text: 'ЮВАО,',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('ЮВАО,');
                              }),
                        TextSpan(
                            text: 'Печатники,',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Печатники,');
                              }),
                        TextSpan(text: "ул. Полбина, 23, корпус 1")
                      ])),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(grayLightButton)),
                      onPressed: () => {},
                      child: Icon(
                        Icons.location_on_outlined,
                        color: blackColor,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFFFFC675),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '9.5',
                        style: TextStyle(
                            color: Color(0xFF2F2F2F),
                            fontSize: 24,
                            fontFamily: 'MullerNarrow',
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        useRootNavigator: true,
                        builder: (BuildContext context) {
                          return Ratings();
                        },
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12))),
                      )
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(grayLightButton)),
                    child: Row(children: [
                      Text(
                        "12 отзывов",
                        style: TextStyle(color: blackColor),
                      )
                    ]),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        useRootNavigator: true,
                        builder: (BuildContext context) {
                          return AddRating();
                        },
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      )
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(grayLightButton)),
                    child: Row(children: [
                      SvgPicture.asset("assets/icons/message.svg"),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Оставить",
                        style: TextStyle(color: blackColor),
                      )
                    ]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/bx-wifi.svg.svg"),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Wi-Fi',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset("assets/icons/credit-card.svg"),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Оплата картой',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 9,
                      left: 10,
                      right: 12,
                      bottom: 11,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-0.71, -0.71),
                        end: Alignment(0.71, 0.71),
                        colors: [Color(0xFF339E9E), Color(0xFF307E7D)],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone_enabled_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Позвонить',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 9,
                      left: 14,
                      right: 13,
                      bottom: 11,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFF54BB6A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/whatsapp.svg",
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'WhatsApp',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Color(0xFFF5F5F5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Номеров:',
                            style: TextStyle(
                              color: Color(0xFF2F2F2F),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                                color: Color(0xFF2F2F2F),
                                fontSize: 24,
                                fontFamily: 'MullerNarrow',
                                fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return const RoomFilter();
                              },
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))))
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(grayLightButton)),
                        child: Row(children: [
                          SvgPicture.asset(
                            "assets/icons/scale.svg",
                            color: blackColor,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "К списку",
                            style: TextStyle(color: blackColor),
                          )
                        ]),
                      )
                    ],
                  ),
                  RoomItem(),
                  RoomItem(),
                  RoomItem(),
                ],
              ),
            ),
            Container(
              color: Color(0xFFF5F5F5),
              padding: EdgeInsets.all(16.0),
              child: Text(
                'В районе Печатники вы можете отлично провести время вдвоем в одной из недорогих гостиниц. Отель Ампир в Москве отличается приемлемой ценовой категорий, на 2-3 часа здесь можно остановиться абсолютно без ущерба для своего кошелька. Это хорошее решение и для отдыха на всю ночь. Можно побыть только вдвоем, отвлечься от хлопот и забот.',
                style: TextStyle(
                  color: Color(0xFF2F2F2F),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
