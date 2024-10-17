import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    return Container();
  }
}
