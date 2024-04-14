import 'package:flutter/material.dart';
import 'package:silesua/pages/event_page.dart';

class Events extends StatelessWidget {
  // final String imgpath;
  Events({super.key});

  final List<String> events = [
    'assets/images/event1.jpg',
    'assets/images/event2.jpg',
    'assets/images/event3.jpg',
    'assets/images/event4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        // height: MediaQuery.of(context).size.height * 0.45,
        // width: MediaQuery.of(context).size.width * 0.90,
        child: GestureDetector(
          onTap: (){
            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EventPage()));
          },
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: ((context, index) {
              return Expanded(
                // height: MediaQuery.of(context).size.height * 0.17,
                // width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 200,
                        width: 380,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.pink.shade50),
                        child: Image.asset(
                          events[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
