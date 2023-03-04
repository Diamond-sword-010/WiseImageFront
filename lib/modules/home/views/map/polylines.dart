import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FPolylineLayer extends StatelessWidget {
  const FPolylineLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return PolylineLayer(
      polylineCulling: false,
      polylines: [
        Polyline(
          strokeWidth: 3,
          points: [
            LatLng(31.771959, 35.217018),
            LatLng(31, 35.3),
            LatLng(32, 36),
            LatLng(31.771959, 35.217018),
          ],
          color: Colors.blue,
        ),
      ],
    );
  }
}
