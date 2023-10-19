import 'package:class_travel_app/screens/nav_screens/analytics.dart';
import 'package:class_travel_app/screens/home.dart';
import 'package:class_travel_app/screens/nav_screens/profile.dart';
import 'package:class_travel_app/screens/nav_screens/search.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List pages = [
    const HomePage(),
    const AnalyticsPage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: 'Analytics', icon: Icon(Icons.bar_chart_rounded)),
            BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ]),
      body: pages[currentIndex],
    );
  }
}
