// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  // final String imgpath;
  // final String name;
  // final String sneekpeak;
  // final String profilepic;
  Stories({
    super.key,
    // required this.imgpath,
    // required this.name,
    // required this.sneekpeak,
    // required this.profilepic,
  });

  static List<StoryModel> stories = [
    StoryModel(
      imgpath: 'assets/images/mita.webp',
      name: 'Arianne Henry',
      sneekpeak: 'Zebiba Hassan-Ali holding her daughter, Mita, while walking in the center of Dessie. Image by Arianne Lachapelle Henry.',
      // https://pulitzercenter.org/stories/ethiopian-domestic-workers-longing-home
      profilepic: 'assets/images/Arianne_Henry.webp',
    ),
    StoryModel(
      imgpath: 'assets/images/womenMH.webp',
      name: 'Arinanne Henry',
      sneekpeak: 'Women being cared for talk on the back patio of Agar.',
      // https://pulitzercenter.org/stories/ethiopia-stigmas-barrier-mental-health-care
      profilepic: 'assets/images/Arianne_Henry.webp',
    ),
    StoryModel(
      imgpath: 'assets/images/waisa_1.webp',
      name: 'Sarah Waiswa',
      sneekpeak: 'Winnie Achieng’ at the One Development Centre leading a discussion during a Girls on the Move session.',
      // https://pulitzercenter.org/stories/here-theyre-safe-girls-club-emerged-when-kenyas-schools-closed
      profilepic: 'assets/images/Sarah_Waiswa.webp',
    ),
    StoryModel(
      imgpath: 'assets/images/ethiowoman.jpg',
      name: 'Sultan',
      sneekpeak: 'The Ethiopian Woman: In a joking way, I asked, "So are you here on business or pleasure." She laughed.',
      // https://storywrite.com/story/7750599-The-Ethiopian-Woman-by-sultan
      profilepic: 'assets/images/sultan.jpg',
    ),
  ];

  List<StoryModel> displayList = List.from(stories);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: MediaQuery.of(context).size.height * 0.45,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: displayList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              //story container
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 130,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 233, 215, 232),                    
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 130,
                        width: 150,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              displayList[index].imgpath,
                              fit: BoxFit.cover,
                            ),
                        ), 
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          displayList[index].sneekpeak,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //comment container
              Container(
                height: 30,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                padding: EdgeInsets.all(5),
                // color: Color.fromARGB(255, 255, 212, 227),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Color.fromARGB(255, 255, 233, 240),
                  border: Border.all(
                    // color: Color.fromARGB(255, 219, 41, 191),
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(displayList[index].profilepic),
                    ),
                    Text(
                      displayList[index].name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
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
                        Text('53'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class StoryModel {
  final String imgpath;
  final String name;
  final String sneekpeak;
  final String profilepic;

  StoryModel({
    required this.imgpath,
    required this.name,
    required this.sneekpeak,
    required this.profilepic,
  });
}
