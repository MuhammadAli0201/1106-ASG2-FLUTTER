import 'package:flutter/material.dart';
import 'Page1.dart';
void main() {
  runApp(const TravelApp());
}
class TravelApp extends StatefulWidget {
  const TravelApp({ Key? key }) : super(key: key);

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page1(),
      
    );
  }
}