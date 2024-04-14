// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final String imgpath;
  final String name;
  final String sneekpeak;
  final String profilepic;
  const Stories({
    super.key,
    required this.imgpath,
    required this.name,
    required this.sneekpeak,
    required this.profilepic,
  });
  //this relation of widgets with attributes in their default construction must be broken!!

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Expanded(
        // height: MediaQuery.of(context).size.height * 0.45,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Expanded(
              // width: MediaQuery.of(context).size.width * 0.9,
              // height: MediaQuery.of(context).size.height * 0.18,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 246, 203, 218),
                    ),
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //image container
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: const BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Image.network(
                              imgpath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.pink.shade50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.1,
                                decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Image.network(
                                  profilepic,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(name),
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.offline_share,
                              color: Color.fromARGB(255, 238, 53, 115),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('233'),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.comment,
                              color: Color.fromARGB(255, 238, 53, 115),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('233'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Storymodel {
  final String imgpath;
  final String name;
  final String sneekpeak;
  final String profilepic;

  Storymodel({
    required this.imgpath,
    required this.name,
    required this.sneekpeak,
    required this.profilepic,
  });
}
