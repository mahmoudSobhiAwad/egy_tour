import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationView extends StatefulWidget {
  const LocationView(
      {super.key, required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;
  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  List<Marker> markers = <Marker>[];

  @override
  void initState() {
    super.initState();
    markers.add(
      Marker(
          markerId: MarkerId('location'),
        position: LatLng(widget.latitude, widget.longitude),
        infoWindow: InfoWindow(title: 'Location')
      )
    );
  }
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    CameraPosition cairo = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 15,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: cairo,
        mapType: MapType.normal,
        markers: Set<Marker>.of(markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
