import 'package:geolocator/geolocator.dart';

// Function to get the current location
Future<Position> getCurrentLocation() async {
  // Check if location services are enabled
  bool servicePermission = await Geolocator.isLocationServiceEnabled();
  if (!servicePermission) {
    throw Exception('Location services are disabled.');
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }
  }

  return await Geolocator.getCurrentPosition();
}
