import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/features/home/models/hotels.dart';
import 'package:booking/ui/widget/item/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'control_button.dart';
import 'dialog_item.dart';
import 'map_page.dart';

class ClusterizedPlacemarkCollectionPage extends MapPage {
  ClusterizedPlacemarkCollectionPage({Key? key})
      : super('ClusterizedPlacemarkCollection example', key: key);

  @override
  Widget build(BuildContext context) {
    return _ClusterizedPlacemarkCollectionExample(
      dataController: controller,
    );
  }
}

class _ClusterizedPlacemarkCollectionExample extends StatefulWidget {
  HomeController dataController;

  _ClusterizedPlacemarkCollectionExample({required this.dataController});

  @override
  _ClusterizedPlacemarkCollectionExampleState createState() =>
      _ClusterizedPlacemarkCollectionExampleState();
}

class _ClusterizedPlacemarkCollectionExampleState
    extends State<_ClusterizedPlacemarkCollectionExample> {
  final List<MapObject> mapObjects = [];

  // final int kPlacemarkCount = 500;
  final Random seed = Random();
  final MapObjectId mapObjectId =
      const MapObjectId('clusterized_placemark_collection');
  final MapObjectId largeMapObjectId =
      const MapObjectId('large_clusterized_placemark_collection');

  Future<Uint8List> _buildClusterAppearance(Cluster cluster) async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    const size = Size(200, 200);
    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    const radius = 60.0;

    final textPainter = TextPainter(
        text: TextSpan(
            text: cluster.size.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 50)),
        textDirection: TextDirection.ltr);

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    final textOffset = Offset((size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2);
    final circleOffset = Offset(size.height / 2, size.width / 2);

    canvas.drawCircle(circleOffset, radius, fillPaint);
    canvas.drawCircle(circleOffset, radius, strokePaint);
    textPainter.paint(canvas, textOffset);

    final image = await recorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final pngBytes = await image.toByteData(format: ImageByteFormat.png);

    return pngBytes!.buffer.asUint8List();
  }

  double _randomDouble() {
    return (500 - seed.nextInt(1000)) / 1000;
  }

  bool isDialogOpen = false;

  @override
  Widget build(BuildContext context) {
    // var dataController = context.watch<HomeController>().filteredHotels;//Provider.of<HomeController>(context).filteredHotels;
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Stack(
            children: [
              YandexMap(
                mapObjects: mapObjects,
                zoomGesturesEnabled: true,
                rotateGesturesEnabled: true,
                scrollGesturesEnabled: true,
                onMapCreated: (controller) async {
                  controller.moveCamera(CameraUpdate.newCameraPosition(
                      const CameraPosition(
                          target: Point(
                              latitude: 55.750104508210704,
                              longitude: 37.61211651717664),
                          zoom: 8.0)));

                  if (mapObjects.any((el) => el.mapId == largeMapObjectId)) {
                    return;
                  }

                  final largeMapObject = ClusterizedPlacemarkCollection(
                    mapId: largeMapObjectId,
                    radius: 30,
                    minZoom: 15,
                    onClusterAdded: (ClusterizedPlacemarkCollection self,
                        Cluster cluster) async {
                      return cluster.copyWith(
                          appearance: cluster.appearance.copyWith(
                              opacity: 0.75,
                              icon: PlacemarkIcon.single(PlacemarkIconStyle(
                                  image: BitmapDescriptor.fromBytes(
                                      await _buildClusterAppearance(cluster)),
                                  scale: 1))));
                    },
                    onClusterTap:
                        (ClusterizedPlacemarkCollection self, Cluster cluster) {
                      print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
                      print('Tapped cluster: ${cluster.placemarks}');
                      print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
                    },
                    placemarks: List<PlacemarkMapObject>.generate(
                        widget.dataController.allHotels.length, (i) {
                      return PlacemarkMapObject(
                          mapId: MapObjectId(
                            'placemark_${int.parse(widget.dataController.allHotels[i]!.id!)}',
                          ),
                          onTap: (mapObject, point) {
                            if (!isDialogOpen) {
                              isDialogOpen = true;
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    print(
                                        '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
                                    print(point.toJson());

                                    var find = widget.dataController.allHotels
                                        .where((element) =>
                                            point.latitude.toString().contains(
                                                element!.lat!.toString()) &&
                                            point.longitude.toString().contains(
                                                element.lng!.toString()))
                                        .toList();
                                    //   Hotels find = widget.dataController.filteredHotels[0];
                                    return Dialog(
                                      insetPadding: const EdgeInsets.all(8),
                                      // clipBehavior: Clip.antiAlias,
                                      elevation: 0,
                                      child: ItemWidget(
                                        hotel:
                                            widget.dataController.allHotels[i]!,
                                        isRoom: false,
                                      ),
                                    );
                                  }).then((_) {
                                isDialogOpen = false;
                              });
                            }
                            print(
                                'Tapped me at $point/////////////////////////////////////////');
                          },
                          text: PlacemarkText(
                              text:
                                  '${widget.dataController.allHotels[i]!.price!} ₽', //"Hello",
                              style: const PlacemarkTextStyle(
                                  color: Colors.black,
                                  size: 12,
                                  placement: TextStylePlacement.center)),
                          point: Point(
                            latitude: double.parse(
                                widget.dataController.allHotels[i]!.lat!),
                            //55.756 + _randomDouble(),
                            longitude: double.parse(widget
                                .dataController
                                .allHotels[i]!
                                .lng!), //37.618 + _randomDouble(),
                          ),
                          icon: PlacemarkIcon.single(PlacemarkIconStyle(
                              image: BitmapDescriptor.fromAssetImage(
                                  'assets/icons/marker_bg.png'),
                              scale: 1)));
                    }),
                  );

                  setState(() {
                    mapObjects.add(largeMapObject);
                  });
                },
              ),
              Positioned(
                left: 10,
                bottom: 210,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          color: Colors.white,
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(

                        trackHeight: 8.0, // Thickness of the slider track
                        thumbShape: const RoundSliderThumbShape(
                        //  disabledThumbRadius: 0,
                          enabledThumbRadius: 10, // Size of the slider thumb
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 0.0, // Padding around the thumb
                        ),
                      ),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Slider(
                          thumbColor: Colors.white,
                          activeColor: Colors.red,
                          inactiveColor: Colors.black12,
                          min: 0.0,
                          max: 20.0,
                          value: 5,
                          onChanged: (double value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    Card(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          color: Colors.white,
                          child: const Icon(Icons.remove),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          )),
        ]);
  }
}
