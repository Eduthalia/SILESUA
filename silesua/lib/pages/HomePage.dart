// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final address = ['Police Station','Women\'s Association','Legal Consultants','Health Professionals','Psychologists'];
  final numbers = ['991','+251952048277','7711','8335','+251 945 565656'];
  final images = [
    'assets/images/EPD.jpg',
    'assets/images/ewass.jpg',
    'assets/images/ewla.jpg',
    'assets/images/medicine.jpg',
    'assets/images/psych.jpg'
  ];

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
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_circle_left_outlined,
        //     color: Color.fromARGB(255, 219, 41, 191),
        //     size: 30,
        //   ),
        //   onPressed: (){
        //     Navigator.of(context).pop();
        //   },
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.notifications_rounded),
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 210, 248),
                ),
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,           
                child: Text(
                  "Who would you like to contact?",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
                ),
              ),
              Contacts('Police Station','991','assets/images/EPD.jpg'),
              Contacts('Women\'s Association', '+251952048277', 'assets/images/ewass.jpg'),
              Contacts('Legal Consultants', '7711', 'assets/images/ewla.jpg'),
              Contacts('Health Professionals', '8335', 'assets/images/medicine.jpg'),
              Contacts('Psychologists', '+251945565656', 'assets/images/psych.jpg'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Color.fromARGB(255, 219, 41, 191),
        currentIndex: 4,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message',),
          BottomNavigationBarItem(icon: Icon(Icons.family_restroom), label: 'Consultants'),
          BottomNavigationBarItem(icon: Icon(Icons.person_3_sharp), label: 'Vent'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Contacts'),
        ]
      ),
    );
  }
}

class Contacts extends StatelessWidget {
  final String Institution, Number, ImagePath;
  Contacts(this.Institution, this.Number, this.ImagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 255, 210, 248),
      ),
      height: 100,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15),
      alignment: Alignment.center,           
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(//find a way to align this or use a container again
            //works using the space around
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  Institution,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final Uri url = Uri(
                      scheme: 'tel',
                      path: Number,
                    );
                    if(await canLaunchUrl(url)){
                      await launchUrl(url);
                    } else {
                      print("Can't launch url");
                    }
                    },
                  child: Text(
                    Number,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color.fromARGB(255, 219, 41, 191),
                    ),
                  ),
                )
              ],
            ),
          ),
          ClipRRect(                      
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(ImagePath),                    
          ),
        ],
      ),
    );
  }
}