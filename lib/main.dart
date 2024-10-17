import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_current_location_app/custom_slevated_style.dart';
import 'package:get_current_location_app/custom_text_function.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GeoLoactionApp(),
    );
  }
}

class GeoLoactionApp extends StatefulWidget {
  const GeoLoactionApp({super.key});

  @override
  State<GeoLoactionApp> createState() => _GeoLoactionAppState();
}

class _GeoLoactionAppState extends State<GeoLoactionApp> {
  Position? currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;
  String currentAddress = "";

  // Function to get the current location
  Future<Position> getCurrentLocation() async {
    // Check if location services are enabled
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      if (kDebugMode) {
        print('Service disabled');
      }
    }

    // Request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Get the current position
    return await Geolocator.getCurrentPosition();
  }

  // Function to get the address from the coordinates
  Future<void> getAddressFromCoordinates() async {
    if (currentLocation != null) {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            currentLocation!.latitude, currentLocation!.longitude);
        Placemark place = placemarks[0];

        // Update the UI with the new address
        setState(() {
          currentAddress = '${place.locality}, ${place.country}';
        });
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      if (kDebugMode) {
        print('Location not available');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Current Location'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customTextWidget('Location Coordinates'),
            const SizedBox(height: 6),
            Text(
              currentLocation != null
                  ? 'Latitude: ${currentLocation!.latitude}, Longitude: ${currentLocation!.longitude}'
                  : 'Location not available',
            ),
            const SizedBox(height: 30),
            customTextWidget('Location Address'),
            const SizedBox(height: 6),
            Text(currentAddress),
            const SizedBox(height: 50),
            ElevatedButton(
                style: customElevatedButtonStyle(),
                onPressed: () async {
                  // Get the location and update the UI
                  Position location = await getCurrentLocation();
                  setState(() {
                    currentLocation = location;
                  });

                  // Get the address from coordinates
                  await getAddressFromCoordinates();

                  if (kDebugMode) {
                    print('Location: $currentLocation');
                    print('Address: $currentAddress');
                  }
                },
                child: customTextWidget('Get Location',
                    fontsize: 19, color: Colors.cyan)),
          ],
        ),
      ),
    );
  }
}
