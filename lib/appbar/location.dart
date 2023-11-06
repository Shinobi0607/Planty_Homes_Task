import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  static const LatLng chandigarhCoordinates = LatLng(30.7333, 76.7794);

  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            buildingsEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(0, 0),
              zoom: 1,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
              _startMapAnimation();
            },
          ),
          Positioned(
            top: 40,
            right: 20,
            left: 20,
            child: Container(
              height: 100,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/menu.svg',
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(child: LocationSearchBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _startMapAnimation() {
    final worldView = CameraPosition(
      target: LatLng(0, 0),
      zoom: 1,
    );

    final indiaView = CameraPosition(
      target: LatLng(20, 78),
      zoom: 5,
    );

    final chandigarhView = CameraPosition(
      target: chandigarhCoordinates,
      zoom: 15,
    );

    Future.delayed(Duration(seconds: 1), () {
      _mapController?.animateCamera(CameraUpdate.newCameraPosition(worldView));
    });
    Future.delayed(Duration(seconds: 3), () {
      _mapController?.animateCamera(CameraUpdate.newCameraPosition(indiaView));
    });
    Future.delayed(Duration(seconds: 5), () {
      _mapController
          ?.animateCamera(CameraUpdate.newCameraPosition(chandigarhView));
    });
  }
}

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search for a location',
          suffixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.only(left: 20, bottom: 5, right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
