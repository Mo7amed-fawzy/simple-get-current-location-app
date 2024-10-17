import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

// Function to get the address from the coordinates
Future<String> getAddressFromCoordinates(Position position) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // placemarkFromCoordinates(currentLocation!.latitude, currentLocation!.longitude);
    Placemark place = placemarks[0];
    return '${place.locality}, ${place.country}';
  } catch (e) {
    throw Exception('Failed to get address: $e');
  }
}
