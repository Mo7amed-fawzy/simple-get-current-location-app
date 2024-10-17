import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_current_location_app/custom_text_function.dart';
import 'package:get_current_location_app/functions/address_access.dart';
import 'package:get_current_location_app/functions/location_access.dart';
import 'package:get_current_location_app/widgets/custom_slevated_style.dart';

class GeoLoactionApp extends StatefulWidget {
  const GeoLoactionApp({super.key});

  @override
  State<GeoLoactionApp> createState() => _GeoLoactionAppState();
}

class _GeoLoactionAppState extends State<GeoLoactionApp> {
  Position? currentLocation;
  String currentAddress = "";
  late Position location;
  late String address;

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
                try {
                  // Get the location and update the UI
                  location = await getCurrentLocation();
                  setState(() {
                    currentLocation = location;
                  });

                  // Get the address from coordinates
                  address = await getAddressFromCoordinates(location);
                  setState(() {
                    currentAddress = address;
                  });

                  // Debug print statements
                  if (kDebugMode) {
                    print('Location: $currentLocation');
                    print('Address: $currentAddress');
                  }
                } catch (e) {
                  if (kDebugMode) {
                    print('Error: $e');
                  }
                }
              },
              child: customTextWidget('Get Location',
                  fontsize: 19, color: Colors.cyan),
            ),
          ],
        ),
      ),
    );
  }
}
