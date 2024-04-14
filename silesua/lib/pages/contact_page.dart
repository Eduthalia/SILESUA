// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  static List<ContactsModel> getContacts = [
    ContactsModel(name: 'Police Station', number: '991', image: 'assets/images/EPD.jpg'),
    ContactsModel(name: 'Women\'s Association', number: '+251 952 048277', image: 'assets/images/ewass.jpg'),
    ContactsModel(name: 'Legal Consultants', number: '7711', image: 'assets/images/ewla.jpg'),
    ContactsModel(name: 'Health Professionals', number: '8335', image: 'assets/images/medicine.jpg'),
    ContactsModel(name: 'Psychologists', number: '+251 945 565656', image: 'assets/images/psych.jpg'),
  ];

  List<ContactsModel> displayList = List.from(getContacts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              // color: Color.fromARGB(255, 219, 41, 191),
            ),
            padding: EdgeInsets.all(15),
            // margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
            alignment: Alignment.center,
            child: Text(
              "Who would you like to contact?",
              style: TextStyle(
                color: Color.fromARGB(255, 219, 41, 191),
                fontFamily: 'BioRhyme',
                fontSize: 22,
              ),
            ),
          ),
          // SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 233, 215, 232),
                  ),
                  height: 100,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        //find a way to align this or use a container again
                        //works using the space around
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              displayList[index].name!,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                final Uri url = Uri(
                                  scheme: 'tel',
                                  path: displayList[index].number!,
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  print("Can't launch url");
                                }
                              },
                              child: Text(
                                'Contact',
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
                        child: Image.asset(displayList[index].image),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ContactsModel{
  final String? name;
  final String? number;
  final String image;

  ContactsModel({this.name, this.number, required this.image});
}
