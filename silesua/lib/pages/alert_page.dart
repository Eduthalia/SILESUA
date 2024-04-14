// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  // bool _isButtonEnabled = false;
  bool _alertSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Silesua",
          style: TextStyle(
            fontFamily: 'BioRhyme',
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromARGB(255, 219, 41, 191),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: Color.fromARGB(255, 219, 41, 191),
            size: 30,
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.message),
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.notifications_rounded),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
            SizedBox(height: 50),
            GestureDetector(
              onLongPress: () {
                Future.delayed(Duration(seconds: 3), () {
                  setState(() {
                    // _isButtonEnabled = true;
                  });
                  _sendAlert();
                });
              },
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFFDB29BF), // Silesua color
                  // borderRadius: BorderRadius.circular(75), // Make it a circle
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 7,
                      blurRadius: 8,
                      offset: Offset(4, 4), // changes position of shadow
                    ),
                    // BoxShadow(
                    //   color: Colors.white,
                    //   spreadRadius: 7,
                    //   blurRadius: 8,
                    //   offset: Offset(-4, -4), // changes position of shadow
                    // ),
                  ],
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
