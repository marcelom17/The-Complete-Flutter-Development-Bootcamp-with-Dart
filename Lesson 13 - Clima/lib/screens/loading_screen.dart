import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    location = new Location();
    await location.getCurrentLocation();
    print("Latitude: " +
        location.latitude.toString() +
        " \tLongitude: " +
        location.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
