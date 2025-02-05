import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async code in main()

  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('habitBox'); // Open a Hive storage box

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple, // Main theme color
        scaffoldBackgroundColor: Colors.deepPurple[100], // Background
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple, // AppBar color
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.purpleAccent, // FAB color
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStatePropertyAll(Colors.purple), // Checkbox color
        ),
      ),
      home: const HomePage(),
    );
  }
}
