import 'dart:async';

import 'package:booking/core/api_params.dart';
import 'package:booking/core/sqlite_service.dart';
import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/features/home/models/detail_model.dart';
import 'package:booking/features/home/models/favorites.dart';
import 'package:booking/features/home/models/hotel_details/metro_model.dart';
import 'package:booking/ui/page/home.dart';
import 'package:booking/ui/router/router.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/theme/txt_style.dart';
import 'package:booking/ui/widget/app_bar.dart';
import 'package:booking/ui/widget/detail/add_rating.dart';
import 'package:booking/ui/widget/detail/filter/room_filter.dart';
import 'package:booking/ui/widget/detail/ratings.dart';
import 'package:booking/ui/widget/detail/recall.dart';
import 'package:booking/ui/widget/detail/room_item.dart';
import 'package:booking/utils/call/call.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../features/home/models/hotel_details/room_model.dart';
import '../widget/app_drawer.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.id});
  final String id;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _controller = HomeController();

  @override
  void initState() {
    // String dynamicId = '2417';
    _controller.fetchingDetails(widget.id);
    _controller.fetchRooms(widget.id, "", "", "", []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return ListenableBuilder(
      listenable: _controller,
      builder: (context, child) {
        if (_controller.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          bottomNavigationBar: bottomNavBar(),
          body: DetailsWidget(
            hotelDetails: _controller.hotelDetails!,
            rooms: _controller.rooms,
            onFiltered: (type, from, to, services) {
              _controller.fetchRooms(widget.id, type, from, to, services);
            },
          ),
        );
      },
    );
  }

  Container bottomNavBar() {
    return Container(
      width: double.infinity,
      height: 60, //const Color(0xB2454545).withOpacity(0.5)
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if ("${_controller.hotelDetails!.hotel!.messengerWhatsapp}" == "1")
            Container(
              padding: const EdgeInsets.only(
                top: 9,
                left: 14,
                right: 13,
                bottom: 11,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFF54BB6A),
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
                  InkWell(
                    onTap: () {
                      openWhatsApp(
                          "https://wa.me/${_controller.hotelDetails!.hotel!.phone}");
                    },
                    child: const Text(
                      'WhatsApp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(
            width: 12,
          ),
          if ("${_controller.hotelDetails!.hotel!.isRecall}" != "0")
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  useRootNavigator: true,
                  builder: (BuildContext context) {
                    return Recall(
                      hotelDetails: _controller.hotelDetails!,
                    );
                  },
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                );
              },
              child: Container(
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
                child: const Row(
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
            ),
        ],
      ),
    );
  }
}

class DetailsWidget extends StatefulWidget {
  HotelDetails hotelDetails;
  List<Room> rooms;
  final Function(String, String, String, List<String>) onFiltered;

  DetailsWidget({
    super.key,
    required this.hotelDetails,
    required this.rooms,
    required this.onFiltered,
  });

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget>
    with WidgetsBindingObserver {
  var key1 = GlobalKey();

  final dbHelper = DatabaseHelper();

  var isLiked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    dbHelper
        .isFavoriteById(int.parse(widget.hotelDetails.hotel!.id!))
        .then((value) {
      setState(() {
        isLiked = value;
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    print("State" + state.name);

    if (state == AppLifecycleState.resumed) {
      print("App resumed");
    }
  }

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
    return Container(
      color: white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                      //shellNavigatorKey.currentState?.popUntil((route) => route.isFirst);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(grayLightButton)),
                    child: const Row(children: [
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
                      ),
                    ]),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(grayLightButton)),
                      onPressed: () => {
                            _toggleFavorite(
                                widget.hotelDetails.hotel!.toFavorite())
                          },
                      child: SvgPicture.asset(
                        isLiked
                            ? "assets/icons/HeartStatus.svg"
                            : "assets/icons/heart.svg",
                        color: isLiked ? primaryColor : null,
                      )),
                  ElevatedButton(
                    onPressed: () =>
                        {Scrollable.ensureVisible(key1.currentContext!)},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(grayLightButton)),
                    child: const Row(children: [
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
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Отель",
                        style: TextStyle(
                          fontFamily: "MullerNarrow",
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          color: Color(0xffe50914),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          widget.hotelDetails.hotel!.name!,
                          maxLines: 3,
                          style: const TextStyle(
                            fontFamily: "MullerNarrow",
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff2f2f2f),
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                  CachedNetworkImage(
                    width: 80,
                    height: 80,
                    imageUrl:
                        "$IMG_BASE_URL${widget.hotelDetails.hotel!.logo!}",
                    // "https://picsum.photos/250?image=${Random().nextInt(100)}",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
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
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16),
            //   child: Container(
            //     decoration: ShapeDecoration(
            //       color: Color(0xFFFF555A),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //     ),
            //     child: Padding(
            //       //hotelDetails.hotel!.description!
            //       padding: const EdgeInsets.all(16),
            //       child: Html(
            //         data: widget.hotelDetails.hotel!.description,
            //         onLinkTap: (url, _, __) {
            //           debugPrint("Opening $url...");
            //         },
            //       ),
            //     ),
            //   ),
            // ),

            ///list
            Container(
              height: 25,
              child: ListView.builder(
                  itemCount: widget.hotelDetails.hotel!.metro!.length,
                  itemBuilder: (context, index) {
                    MapEntry<String, Metro>? metroEntry = widget
                        .hotelDetails.hotel!.metro!.entries
                        .elementAt(index);
                    Metro? metro = metroEntry.value;
                    return Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Metro.svg",
                            color: const Color(0xFF7CBE37),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            metro.name ?? "",
                            //'Печатники',
                            style: TextStyle(
                              color: Color(0xFF2F2F2F),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            '${metro.walk} мин',
                            style: TextStyle(
                              color: Color(0xFF585858),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            //
            // Padding(
            //   padding: const EdgeInsets.only(right: 16, left: 16, top: 6),
            //   child: Row(
            //     children: [
            //       SvgPicture.asset(
            //         "assets/icons/Metro.svg",
            //         color: const Color(0xFF7CBE37),
            //       ),
            //       const SizedBox(
            //         width: 6,
            //       ),
            //        Text(
            //         hotelDetails.hotel!.metroName??'',
            //         style: const TextStyle(
            //           color: Color(0xFF2F2F2F),
            //           fontSize: 15,
            //           fontWeight: FontWeight.w400,
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 6,
            //       ),
            //        Text(
            //          '${hotelDetails.hotel!.minHour} мин',
            //         style: TextStyle(
            //           color: Color(0xFF585858),
            //           fontSize: 15,
            //           fontWeight: FontWeight.w400,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Flexible(
                  //   child: FractionallySizedBox(
                  //     widthFactor: 0.7,
                  //     child: RichText(
                  //         text: TextSpan(style: defaultStyle, children: [
                  //       TextSpan(
                  //           text: 'ЮВАО,',
                  //           style: linkStyle,
                  //           recognizer: TapGestureRecognizer()
                  //             ..onTap = () {
                  //               print('ЮВАО,');
                  //             }),
                  //       TextSpan(
                  //           text: 'Печатники,',
                  //           style: linkStyle,
                  //           recognizer: TapGestureRecognizer()
                  //             ..onTap = () {
                  //               print('Печатники,');
                  //             }),
                  //        TextSpan(text: hotelDetails.hotel!.address!)
                  //     ])),
                  //   ),
                  // ),
                  Flexible(
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: Html(
                        data: widget.hotelDetails.hotel!.address!,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(grayLightButton)),
                      onPressed: () => {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: ((context) {
                                  return Container(
                                    child: Column(children: [
                                      Expanded(
                                          flex: 9,
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    context.pop();
                                                  },
                                                  icon: Icon(Icons.close))
                                            ],
                                          )),
                                      Expanded(
                                        child: WebViewWidget(
                                            controller: WebViewController()
                                              ..setJavaScriptMode(
                                                  JavaScriptMode.unrestricted)
                                              ..setBackgroundColor(
                                                  const Color(0x00000000))
                                              ..setNavigationDelegate(
                                                NavigationDelegate(
                                                  onProgress: (int progress) {
                                                    // Update loading bar.
                                                  },
                                                  onPageStarted:
                                                      (String url) {},
                                                  onPageFinished:
                                                      (String url) {},
                                                  onWebResourceError:
                                                      (WebResourceError
                                                          error) {},
                                                  onNavigationRequest:
                                                      (NavigationRequest
                                                          request) {
                                                    return NavigationDecision
                                                        .navigate;
                                                  },
                                                ),
                                              )
                                              ..loadRequest(Uri.parse(
                                                  'https://yandex.ru/maps/?pt=${widget.hotelDetails.hotel!.lng},${widget.hotelDetails.hotel!.lat}&z=17&l=map'))),
                                        flex: 89,
                                      )
                                    ]),
                                  );
                                }))
                          },
                      child: const Icon(
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
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFC675),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.hotelDetails.hotel!.ratingTotal ?? '',
                        style: const TextStyle(
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
                          return Ratings(
                            hotelDetails: widget.hotelDetails,
                          );
                        },
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      )
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(grayLightButton)),
                    child: Row(children: [
                      Text(
                        "${widget.hotelDetails.reviews!.keys.length} отзывов",
                        style: const TextStyle(color: blackColor),
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
                          return AddRating(
                            hotelDetails: widget.hotelDetails,
                          );
                        },
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      )
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(grayLightButton)),
                    child: Row(children: [
                      SvgPicture.asset("assets/icons/message.svg"),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        "Оставить",
                        style: TextStyle(color: blackColor),
                      )
                    ]),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                runSpacing: 12,
                children: widget.hotelDetails.roomOptions!.options!.entries
                    .map((e) => Wrap(
                          children: [
                            SvgPicture.asset(
                              "assets/features/ico-${e.value.ico}.svg",
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "${e.value.title}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            )
                          ],
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  if ("${widget.hotelDetails.hotel!.phone}".trim().isNotEmpty)
                    InkWell(
                      onTap: () {
                        makePhoneCall(
                            "${widget.hotelDetails.hotel!.phone}", context);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 9,
                          left: 10,
                          right: 12,
                          bottom: 11,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(-0.71, -0.71),
                            end: Alignment(0.71, 0.71),
                            colors: [Color(0xFF339E9E), Color(0xFF307E7D)],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone_enabled_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 8),
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
                    ),
                  if ("${widget.hotelDetails.hotel!.messengerWhatsapp}" == "1")
                    Container(
                      padding: const EdgeInsets.only(
                        top: 9,
                        left: 14,
                        right: 13,
                        bottom: 11,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF54BB6A),
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
                          InkWell(
                            onTap: () {
                              openWhatsApp(
                                  "https://wa.me/${widget.hotelDetails.hotel!.phone}");
                            },
                            child: const Text(
                              'WhatsApp',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if ("${widget.hotelDetails.hotel!.messengerTelegram}" == "1")
                    Container(
                      padding: const EdgeInsets.only(
                        top: 9,
                        left: 14,
                        right: 13,
                        bottom: 11,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF229ED9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/tg.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              openWhatsApp(
                                  "https://t.me/${widget.hotelDetails.hotel!.phone}");
                            },
                            child: const Text(
                              'Telegram',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if ("${widget.hotelDetails.hotel!.messengerFacebook}" == "1")
                    Container(
                      padding: const EdgeInsets.only(
                        top: 9,
                        left: 14,
                        right: 13,
                        bottom: 11,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF3b5998),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/fc.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              openWhatsApp("https://www.facebook.com/");
                            },
                            child: const Text(
                              'Facebook',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if ("${widget.hotelDetails.hotel!.messengerViber}" == "1")
                    Container(
                      padding: const EdgeInsets.only(
                        top: 9,
                        left: 14,
                        right: 13,
                        bottom: 11,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF54BB6A),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/vb.svg",
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              openWhatsApp(
                                  "viber://contact?number=${widget.hotelDetails.hotel!.phone}");
                            },
                            child: const Text(
                              'Viber',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            widget.rooms != null
                ? Container(
                    key: key1,
                    padding: const EdgeInsets.all(16),
                    color: const Color(0xFFF5F5F5),
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
                                  widget.rooms!.length.toString() ?? '',
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
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return RoomFilter(
                                        hotelDetails: widget.hotelDetails,
                                        onFiltered: widget.onFiltered,
                                        count:
                                            widget.rooms!.length.toString() ??
                                                '',
                                      );
                                    },
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))))
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      grayLightButton)),
                              child: Row(children: [
                                SvgPicture.asset(
                                  "assets/icons/scale.svg",
                                  color: blackColor,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  "Удобства",
                                  style: TextStyle(color: blackColor),
                                )
                              ]),
                            )
                          ],
                        ),
                        widget.rooms != null
                            ? RoomItemList(
                                hotelDetails: widget.hotelDetails,
                                rooms: widget.rooms,
                              )
                            : Container(),
                        //
                        //  RoomItem(),
                        //  RoomItem(),
                      ],
                    ),
                  )
                : Container(),
            Container(
              color: const Color(0xFFF5F5F5),
              padding: const EdgeInsets.all(16.0),
              child:
              Html(
                data: widget.hotelDetails.hotel!.description,
                onLinkTap: (url, _, __) {
                  debugPrint("Opening $url...");
                },
              ),

              // Text(
              //   widget.hotelDetails.hotel!.search != null
              //       ? widget.hotelDetails.hotel!.search!
              //       : '',
              //   //'В районе Печатники вы можете отлично провести время вдвоем в одной из недорогих гостиниц. Отель Ампир в Москве отличается приемлемой ценовой категорий, на 2-3 часа здесь можно остановиться абсолютно без ущерба для своего кошелька. Это хорошее решение и для отдыха на всю ночь. Можно побыть только вдвоем, отвлечься от хлопот и забот.',
              //   style: TextStyle(
              //     color: Color(0xFF2F2F2F),
              //     fontSize: 15,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}

class RoomItemList extends StatelessWidget {
  const RoomItemList(
      {super.key, required this.hotelDetails, required this.rooms});

  final HotelDetails hotelDetails;
  final List<Room> rooms;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: rooms!.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return RoomItem(
              roomModel: rooms[index], //_controller.hotelDetails!,
              index: index,
              hotelDetails: hotelDetails,
            );
          }),
    );
  }
}
