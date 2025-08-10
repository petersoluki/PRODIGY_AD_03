import 'package:flutter/material.dart';
import 'package:stopwatch_app/stopwatch_home.dart';

void main() {
  runApp(const StopwatchApp());
}

class StopwatchApp extends StatefulWidget {
  const StopwatchApp({super.key});

  @override
  State<StopwatchApp> createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  bool _isDarkMode = true; //Toggles between dark and light mode
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      // theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      theme: _isDarkMode
          ? ThemeData.dark(useMaterial3: false)
          : ThemeData.light(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: StopwatchHome(
        isDarkMode: _isDarkMode,
        onToggleTheme: () {
          setState(() {
            _isDarkMode = !_isDarkMode; //Flip theme and rebuild
          });
        },
      ),
    );
  }
}
