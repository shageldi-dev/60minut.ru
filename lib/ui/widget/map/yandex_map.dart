import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/features/home/models/hotels.dart';
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
              child: YandexMap(
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
                                    .
                                    //     .where((element) =>
                                    // double.parse(element.lat!) == double.parse(point.latitude.toStringAsFixed(6)) &&
                                    //     double.parse(element.lng!) == double.parse(point.longitude.toStringAsFixed(6))
                                    // ).first;

                                    // firstWhere((element) =>
                                    // double.parse(element.lat!) == double.parse(point.latitude.toStringAsFixed(6))
                                    //     && double.parse(element.lng!) == double.parse(point.longitude.toStringAsFixed(6)) );
                                    where((element) =>
                                        point.latitude.toString().contains(
                                            element!.lat!.toString()) &&
                                        point.longitude
                                            .toString()
                                            .contains(element.lng!.toString()))
                                    .toList();
                                //   Hotels find = widget.dataController.filteredHotels[0];
                                return Dialog(
                                  elevation: 0,
                                  child: DialogItem(
                                    name: widget.dataController.allHotels[i]!
                                        .name!, //self.mapId.value,
                                    image: widget
                                        .dataController.allHotels[i]!.img!,
                                    favorite: widget
                                        .dataController.allHotels[i]!.favorite,
                                    metroName: widget.dataController
                                        .allHotels[i]!.metroName!,
                                    walk: widget
                                        .dataController.allHotels[i]!.walk!,
                                    price: widget
                                        .dataController.allHotels[i]!.price!,
                                    priceTypeText: widget.dataController
                                        .allHotels[i]!.priceTypeText!,
                                    minHour: widget
                                        .dataController.allHotels[i]!.minHour!,
                                    phoneNumber: widget
                                        .dataController.allHotels[i]!.phone!,
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
                          style: PlacemarkTextStyle(
                              color: Colors.black,
                              size: 12,
                              placement: TextStylePlacement.center)),
                      point: Point(
                        latitude: double.parse(
                            widget.dataController.allHotels[i]!.lat!),
                        //55.756 + _randomDouble(),
                        longitude: double.parse(widget.dataController
                            .allHotels[i]!.lng!), //37.618 + _randomDouble(),
                      ),
                      icon: PlacemarkIcon.single(PlacemarkIconStyle(
                          image: BitmapDescriptor.fromAssetImage(
                              'assets/icons/marker_bg.png'),
                          scale: 1)));
                }),

                // onTap: (ClusterizedPlacemarkCollection self, Point point) {
                //   if (!isDialogOpen) {
                //     isDialogOpen = true; // Set the flag to true
                //     showDialog(
                //         context: context,
                //         builder: (BuildContext context) {
                //           print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
                //           print(self.toJson());
                //
                //           var finds =
                //           widget.dataController.filteredHotels.
                //           //     .where((element) =>
                //           // double.parse(element.lat!) == double.parse(point.latitude.toStringAsFixed(6)) &&
                //           //     double.parse(element.lng!) == double.parse(point.longitude.toStringAsFixed(6))
                //           // ).first;
                //
                //           // firstWhere((element) =>
                //           // double.parse(element.lat!) == double.parse(point.latitude.toStringAsFixed(6))
                //           //     && double.parse(element.lng!) == double.parse(point.longitude.toStringAsFixed(6)) );
                //           where((element) =>
                //           point.latitude.toString().contains(element.lat!.toString()) && point.longitude.toString().contains(element.lng!.toString())
                //           ).toList();
                //           Hotels find = widget.dataController.filteredHotels[0];
                //           return Dialog(
                //             elevation: 0,
                //             child: DialogItem(
                //               name:find.name!,//self.mapId.value,
                //               image: find.img!,
                //               favorite: find.favorite,
                //               metroName: find.metroName!,
                //               walk: find.walk!,
                //               price: find.price!,
                //               priceTypeText: find.priceTypeText!,
                //               minHour: find.minHour!,
                //             ),
                //           );
                //           //  return Dialog(
                //           //   child: Container(
                //           //     width: 200,
                //           //     height: 100,
                //           //     padding: EdgeInsets.all(12),
                //           //     child: Text("Test"),
                //           //   ),
                //           // );
                //         }).then((_) {
                //       // Set the flag back to false when the dialog is closed
                //       isDialogOpen = false;
                //     });
                //   }
                //
                //     }
              );

              setState(() {
                mapObjects.add(largeMapObject);
              });
            },
          )),
        ]);
  }
}
