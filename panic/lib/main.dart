// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlertPage(),
    );
  }
}

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  bool _isButtonEnabled = false;
  bool _alertSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Silesua',
          style: TextStyle(color: Color(0xFFDB29BF)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFFCE4EC), // Very light pink color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Hold for three seconds to send distress call',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFDB29BF),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onLongPress: () {
                Future.delayed(Duration(seconds: 3), () {
                  setState(() {
                    _isButtonEnabled = true;
                  });
                  _sendAlert();
                });
              },
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFFDB29BF), // Silesua color
                  borderRadius: BorderRadius.circular(75), // Make it a circle
                ),
                child: Center(
                  child: Text(
                    'SOS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _alertSent ? null : () => _sendAlert(),
        tooltip: 'Send Alert',
        backgroundColor: _alertSent ? Colors.grey : Colors.red,
        child: Icon(Icons.warning),
      ),
    );
  }

  void _sendAlert() {
    setState(() {
      _alertSent = true;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Alert successfully sent'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
