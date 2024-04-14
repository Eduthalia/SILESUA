// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../components/biographies.dart';
import '../components/blogs.dart';
import '../components/carouselanimation.dart';
import '../components/events.dart';
import '../components/searchbar.dart';
import '../components/stories_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // final List<Biomodel> biographies = [
  //   Biomodel(
  //       imgpath:
  //           'https://www.itu.int/en/ITU-D/Conferences/WTDC/WTDC21/R2A/PublishingImages/partner2connect/Sahle-Work-Zewde.png',
  //       name: 'President SahleWork Zewdie'),
  //   Biomodel(
  //       imgpath:
  //           'https://www.fanabc.com/english/wp-content/uploads/2023/09/Abeba-Berhane-450x300.png',
  //       name: 'Scientist Abeba irhane'),
  //   Biomodel(
  //       imgpath:
  //           'https://images.csmonitor.com/csm/2019/05/0520%20DDP%20ETHLADIES.jpg?alias=standard_900x600',
  //       name: 'Meaza Ashenafi'),
  //   Biomodel(
  //       imgpath:
  //           'https://www.fanabc.com/english/wp-content/uploads/2023/04/photo_2023-04-27_16-48-37.jpg',
  //       name: 'Derartu Tulu'),
  // ];
  // int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    //TabController _tabController = TabController(length: 4, vsync: this);
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const CarouselSliderAnimation(),
                  //search bar
                  const searchbar(),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        labelColor: Color.fromARGB(255, 238, 53, 115),
                        unselectedLabelColor: Colors.black,
                        isScrollable: true,
                        labelPadding: EdgeInsets.only(left: 10, right: 20),
                        tabs: [
                          Tab(text: 'Stories'),
                          Tab(text: 'Blogs'),
                          Tab(text: 'Events'),
                          Tab(text: 'Biographies'),
                        ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: TabBarView(children: [
                      Stories(
                        // imgpath: biographies[0].imgpath,
                        // name: biographies[0].name,
                        // profilepic: biographies[0].imgpath,
                        // sneekpeak: 'some description',
                      ),
                      Blogs(
                        // imgpath: biographies[0].imgpath,
                        // blogsneakpeek: 'some description',
                      ),
                      Events(
                        // imgpath: biographies[0].imgpath,
                      ),
                      Biographies(
                        // imgpath: biographies[0].imgpath,
                        // name: biographies[0].name,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
