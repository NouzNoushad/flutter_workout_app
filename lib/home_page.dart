import 'package:flutter/material.dart';
import 'package:flutter_workout_app/report.dart';
import 'package:flutter_workout_app/workout_home.dart';

import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  Widget getWidgets(index) {
    switch (index) {
      case 0:
        return const WorkoutHome();
      case 1:
        return const Center(
          child: Text("Training"),
        );
      case 2:
        return const WorkoutReport();
      case 3:
        return const WorkoutProfile();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color.fromARGB(255, 12, 12, 12),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 1, 250, 225),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "training",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: "report",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          ),
        ],
      ),
      body: getWidgets(_currentIndex),
    );
  }
}
