import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(HabitTrackerApp());
}

class HabitTrackerApp extends StatefulWidget {
  @override
  _HabitTrackerAppState createState() => _HabitTrackerAppState();
}

class _HabitTrackerAppState extends State<HabitTrackerApp> {
  bool isDarkMode = false;

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme:
          ThemeData(primarySwatch: Colors.purple, brightness: Brightness.light),
      darkTheme: ThemeData(
          primarySwatch: Colors.deepPurple, brightness: Brightness.dark),
      home: HabitHomeScreen(
          toggleDarkMode: toggleDarkMode, isDarkMode: isDarkMode),
    );
  }
}
