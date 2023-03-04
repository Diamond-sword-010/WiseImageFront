import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FMarkersLayer extends StatelessWidget {
  const FMarkersLayer({super.key});

  @override
  Widget build(BuildContext context) {
    List<Marker> markers = [
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
    return MarkerLayer(
      markers: markers,
    );
  }
}
