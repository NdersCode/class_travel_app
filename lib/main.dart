import 'package:class_travel_app/screens/detail_page.dart';
import 'package:class_travel_app/screens/nav_screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:class_travel_app/screens/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DetailPage(),
    );
  }
}
