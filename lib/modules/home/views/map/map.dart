import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'markers_lyer.dart';
import 'polylines.dart';
import 'zoom_buttons.dart';

class FMap extends StatefulWidget {
  const FMap({
    super.key,
  });

  @override
  State<FMap> createState() => _FMapState();
}

class _FMapState extends State<FMap> {
  List<Marker> list = [
    Marker(
        point: LatLng(31.771959, 35.217018),
        width: 80,
        height: 80,
        builder: (context) => const FlutterLogo()),
    Marker(
      point: LatLng(31, 35.3),
      width: 80,
      height: 80,
      builder: (context) => const FlutterLogo(),
    ),
  ];
  List<StatelessWidget> layers =
      List.from([const FPolylineLayer(), const FMarkersLayer()]);
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(31.771959, 35.217018),
        zoom: 15,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'Basalt Team - Targil 010 Demo',
          onSourceTapped: null,
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        ...layers,
        const FlutterMapZoomButtons(
          minZoom: 4,
          maxZoom: 19,
          mini: true,
          padding: 10,
          alignment: Alignment.bottomLeft,
        ),
        // MarkerLayer(
        //   markers: list,
        // ),
        // FPolylineLayer(),
      ],
    );
  }
}
