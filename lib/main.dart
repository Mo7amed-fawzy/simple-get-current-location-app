import 'package:flutter/material.dart';
import 'package:get_current_location_app/custom_text_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('get current location'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customTextWidget('Location Coordinate'),
            const SizedBox(height: 6),
            const Text('Coordinate'),
            const SizedBox(height: 30),
            customTextWidget('Location Address'),
            const SizedBox(height: 6),
            const Text('Address'),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Get Location',
                  style: TextStyle(
                    color: Colors.cyan,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
