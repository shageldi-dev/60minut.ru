import 'package:booking/ui/widget/map/control_button.dart';
import 'package:booking/ui/widget/map/map_page.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapControlsPage extends MapPage {
  const MapControlsPage({Key? key}) : super('Map controls example', key: key);

  @override
  Widget build(BuildContext context) {
    return _MapControlsExample();
  }
}

class _MapControlsExample extends StatefulWidget {
  @override
  _MapControlsExampleState createState() => _MapControlsExampleState();
}

class _MapControlsExampleState extends State<_MapControlsExample> {
  @override
  void initState() {
    super.initState();
  }

  late YandexMapController controller;
  final List<MapObject> mapObjects = [];

  final MapObjectId targetMapObjectId = const MapObjectId('target_placemark');
  static const Point _point = Point(latitude: 59.945933, longitude: 30.320045);
  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  bool tiltGesturesEnabled = true;
  bool zoomGesturesEnabled = true;
  bool rotateGesturesEnabled = true;
  bool scrollGesturesEnabled = true;
  bool modelsEnabled = true;
  bool nightModeEnabled = false;
  bool fastTapEnabled = false;
  bool mode2DEnabled = false;
  ScreenRect? focusRect;
  MapType mapType = MapType.vector;
  MapMode mapMode = MapMode.normal;
  int? poiLimit;
  MapAlignment logoAlignment = const MapAlignment(
      horizontal: HorizontalAlignment.left, vertical: VerticalAlignment.bottom);

  final String style = '''
    [
      {
        "tags": {
          "all": ["landscape"]
        },
        "stylers": {
          "color": "f00",
          "saturation": 0.5,
          "lightness": 0.5
        }
      }
    ]
  ''';

  String _enabledText(bool enabled) {
    return enabled ? 'on' : 'off';
  }

  MapType _nextMapType(MapType old) {
    switch (old) {
      case MapType.map:
        return MapType.hybrid;
      case MapType.hybrid:
        return MapType.satellite;
      case MapType.satellite:
        return MapType.vector;
      case MapType.vector:
        return MapType.none;
      case MapType.none:
        return MapType.map;
      default:
        return MapType.none;
    }
  }

  MapMode _nextMapMode(MapMode old) {
    switch (old) {
      case MapMode.normal:
        return MapMode.transit;
      case MapMode.transit:
        return MapMode.driving;
      case MapMode.driving:
        return MapMode.normal;
      default:
        return MapMode.normal;
    }
  }

  MapAlignment _nextLogoAlignment(MapAlignment old) {
    if (old.horizontal == HorizontalAlignment.left &&
        old.vertical == VerticalAlignment.bottom) {
      return const MapAlignment(
          horizontal: HorizontalAlignment.center,
          vertical: VerticalAlignment.bottom);
    }

    if (old.horizontal == HorizontalAlignment.center &&
        old.vertical == VerticalAlignment.bottom) {
      return const MapAlignment(
          horizontal: HorizontalAlignment.right,
          vertical: VerticalAlignment.bottom);
    }

    if (old.horizontal == HorizontalAlignment.right &&
        old.vertical == VerticalAlignment.bottom) {
      return const MapAlignment(
          horizontal: HorizontalAlignment.right,
          vertical: VerticalAlignment.top);
    }

    if (old.horizontal == HorizontalAlignment.right &&
        old.vertical == VerticalAlignment.top) {
      return const MapAlignment(
          horizontal: HorizontalAlignment.center,
          vertical: VerticalAlignment.top);
    }

    if (old.horizontal == HorizontalAlignment.center &&
        old.vertical == VerticalAlignment.top) {
      return const MapAlignment(
          horizontal: HorizontalAlignment.left,
          vertical: VerticalAlignment.top);
    }

    if (old.horizontal == HorizontalAlignment.left &&
        old.vertical == VerticalAlignment.top) {
      return const MapAlignment(
          horizontal: HorizontalAlignment.left,
          vertical: VerticalAlignment.bottom);
    }

    throw Exception('Failed to select next logoAlignment');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: YandexMap(
            tiltGesturesEnabled: true,
            zoomGesturesEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            modelsEnabled: true,
            nightModeEnabled: false,
            fastTapEnabled: true,
            mode2DEnabled: false,
            logoAlignment: const MapAlignment(
                horizontal: HorizontalAlignment.right,
                vertical: VerticalAlignment.bottom),
            onMapCreated: (YandexMapController yandexMapController) async {
              controller = yandexMapController;

              final cameraPosition = await controller.getCameraPosition();
              final minZoom = await controller.getMinZoom();
              final maxZoom = await controller.getMaxZoom();

              print('Camera position: $cameraPosition');
              print('Min zoom: $minZoom, Max zoom: $maxZoom');
            },
            onMapTap: (Point point) async {
              print('Tapped map at $point');

              await controller.deselectGeoObject();
            },
            onMapLongTap: (Point point) => print('Long tapped map at $point'),
            onCameraPositionChanged: (CameraPosition cameraPosition,
                CameraUpdateReason reason, bool finished) {
              print('Camera position: $cameraPosition, Reason: $reason');

              if (finished) {
                print('Camera position movement has been finished');
              }
            },
            onObjectTap: (GeoObject geoObject) async {
              print('Tapped object: ${geoObject.name}');

              if (geoObject.selectionMetadata != null) {
                await controller.selectGeoObject(
                    geoObject.selectionMetadata!.id,
                    geoObject.selectionMetadata!.layerId);
              }
            },
          )),
        ]);
  }
}
