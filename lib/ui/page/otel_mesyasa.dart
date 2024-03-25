
import 'package:booking/ui/widget/detail/recall.dart';
import 'package:booking/utils/call/call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/home/data/HomeController.dart';
import 'details.dart';

class MesyasOtelPage extends StatefulWidget {
  const MesyasOtelPage({super.key});
  @override
  State<MesyasOtelPage> createState() => _MesyasOtelPageState();
}

class _MesyasOtelPageState extends State<MesyasOtelPage> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller.fetchMesyasRooms().then((_) {
      _controller.fetchingDetails(_controller.otelMesyasaId!);
      _controller.fetchRooms(_controller.roomMesyasaId!, "", "", "", []);
    });
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
            rooms: _controller.hotelDetails!.rooms!.values.toList(),
            onFiltered: (type, from, to, services) {
              _controller.fetchRooms(_controller.roomMesyasaId!, type, from, to, services);
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