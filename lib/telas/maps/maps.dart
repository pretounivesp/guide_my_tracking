import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(-21.1648164, -47.854071);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _appbar(),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}

Widget _appbar() {
  return AppBar(
    backgroundColor: Colors.green,
    title: Text(
      "Maps",
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 18),
    ),
  );
}
