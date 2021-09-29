import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latitude = position.latitude;
    longitude = position.longitude;
  }
}
