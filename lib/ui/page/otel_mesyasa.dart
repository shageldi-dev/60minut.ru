import 'package:booking/core/api_end_points.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/theme/typography.dart';
import 'package:booking/ui/widget/mesyas_otel_widget.dart';
import 'package:booking/ui/widget/top20_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/home/data/HomeController.dart';

class MesyasOtelPage extends StatefulWidget {
  const MesyasOtelPage({super.key});

  @override
  State<MesyasOtelPage> createState() => _MesyasOtelPageState();
}

class _MesyasOtelPageState extends State<MesyasOtelPage> {
  final _controller = HomeController();

  @override
  void initState() {
    _controller.fetchMesyasHotels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("ТОП-mesyas",
                style: mullerNarrowStyle.copyWith(
                    fontWeight: FontWeight.w300, fontSize: 24)),
          ),
          const SizedBox(
            height: 16,
          ),
          ListenableBuilder(
              listenable: _controller,
              builder: (BuildContext context, Widget? child) {
                if (_controller.mesyasLoading) {
                  return const CircularProgressIndicator();
                }
                return MesyasOtelList(items: _controller.mesyasOtels);
              }),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {
                  //context.go("/all")
                  context.push("/all")
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(grayDarkButton)),
                child: const Text(
                  "Все отели",
                  style: TextStyle(
                      color: blackFont,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
