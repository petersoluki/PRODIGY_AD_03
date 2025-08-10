import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchHome extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  const StopwatchHome({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<StopwatchHome> createState() => _StopwatchHomeState();
}

class _StopwatchHomeState extends State<StopwatchHome> {
  Timer? _timer;
  late DateTime _startTime; //Stores the actual start time
  Duration _elapsed = Duration.zero; // Time passed since start or resume
  bool _isRunning = false; // to know if the timer is running

  //Function to start the stopwatch
  void _startTimer() {
    if (!_isRunning) {
      // Subtract previous elapsed time in case of resume
      _startTime = DateTime.now().subtract(_elapsed);

      _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
        setState(() {
          // Updating the elapsed time by subtracting start from the current time
          _elapsed = DateTime.now().difference(_startTime);
        });
      });

      setState(() {
        _isRunning = true;
      });
    }
  }

  // Function to pause the stopwatch
  void _pauseTimer() {
    if (_isRunning) {
      _timer?.cancel(); // Stop the timer
      setState(() {
        _isRunning = false; //Change to not running
      });
    }
  }

  // Function to reset the stopwatch
  void _resetTimer() {
    _timer?.cancel(); // cancel incase timer is running
    setState(() {
      _elapsed = Duration.zero; //Sets elapsed time to 0
      _isRunning = false;
    });
  }

  // Function to convert Duration into a formatted string MM:SS:CS
  String _formatTime(Duration duration) {
    int minutes = duration.inMinutes; // Total minutes
    int seconds = duration.inSeconds % 60; //Remaining seconds
    int centiseconds = (duration.inMilliseconds % 1000) ~/ 10; //2 digit ms

    // Pad with zeros if needed
    String mm = minutes.toString().padLeft(2, '0');
    String ss = seconds.toString().padLeft(2, '0');
    String cs = centiseconds.toString().padLeft(2, '0');

    return "$mm:$ss:$cs"; // Return formatted string
  }

  // Called when widget is being disposed
  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer if active
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
        centerTitle: true,
        actions: [
          Switch(
            value: widget.isDarkMode,
            onChanged: (_) {
              widget.onToggleTheme(); //Toggle theme
            },
          ),
        ],
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.shade50,
                border: Border.all(color: Colors.blueAccent, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                _formatTime(_elapsed),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),

            // Row of buttons: Start, Pause and Reset
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Start button
                  ElevatedButton(onPressed: _startTimer, child: Text('Start')),

                  // Pause button
                  ElevatedButton(onPressed: _pauseTimer, child: Text('Pause')),
                  SizedBox(width: 20), // Space between buttons
                  // reset button
                  ElevatedButton(onPressed: _resetTimer, child: Text('Reset')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
