// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:silesua/pages/consultant_description.dart';

void main() => runApp(const Consultants());

class Consultants extends StatefulWidget {
  const Consultants({super.key});

  @override
  State<Consultants> createState() => _ConsultantsState();
}

class _ConsultantsState extends State<Consultants> {
  static List<Consultant> consultants_on_call = [
    Consultant('Dr. Mulu Mkonnen', 'Psychiatrist', 'contact',
        'assets/images/Mulu-Mkonnen.jpg'),
    Consultant('Dr. Lidya Solomon', 'Psychiatrist', 'contact',
        'assets/images/lydia.jpg'),
    Consultant('Dr. Tigist Waltenigus', 'Psychiatrist', 'contact',
        'assets/images/tigist.jpg'),
    // Consultant('Dr. Mulu Mekonnen', 'Psychiatrist', 'contact', 'assets/images/lydia.jpg'),
  ];

  List<Consultant> display_list = List.from(consultants_on_call);

  void UpadateList(String value) {
    setState(() {
      display_list = consultants_on_call
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Consult.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                onChanged: (value) => UpadateList(value),
                decoration: InputDecoration(
                  hintText: 'Search for consultants',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: consultants_on_call.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConsultantDescription()));
                      },
                      child: Container(
                        height: 150,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 252, 223, 250),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 130,
                                width: 150,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      consultants_on_call[index].image,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              // SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    consultants_on_call[index].name,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(consultants_on_call[index]
                                      .specialization),
                                  Text(consultants_on_call[index].contact),
                                ],
                              ),
                            ]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Consultant {
  final String name;
  final String specialization;
  final String contact;
  final String image;

  Consultant(this.name, this.specialization, this.contact, this.image);
}
