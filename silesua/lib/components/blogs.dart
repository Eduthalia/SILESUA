// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:silesua/pages/blog_description.dart';

class Blogs extends StatelessWidget {
  // final String imgpath;
  // final String blogsneakpeek;

  Blogs({
    super.key,
    // required this.imgpath,
    // required this.blogsneakpeek
  });

  final List<Blogmodel> blogs = [
    Blogmodel(
      imgpath: 'assets/images/joanna_goddard.jpg',
      blogsneakpeek:
          'A daily blog written by Joanna Goddard, a magazine writer who lives in New York City.',
    ),
    Blogmodel(
      imgpath: 'assets/images/everygirl.jpg',
      blogsneakpeek:
          'The Everygirl is the ultimate online resource helping shape the creative, career-driven woman to experience her life better lived.',
    ),
    Blogmodel(
      imgpath: 'assets/images/blondeabroad.jpg',
      blogsneakpeek:
          'The Blonde Abroad is an award-winning solo female travel & lifestyle blog featuring travel tips, packing guides, budget tips, fashion, festivals, and more.',
    ),
    Blogmodel(
      imgpath: 'assets/images/sixtyandme.jpg',
      blogsneakpeek:
          'Sixty and Me is an online magazine about life after 60. Topics range from makeup for older women and senior dating to retirement advice and more.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.45,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            height: MediaQuery.of(context).size.height * 0.17,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlogDescription()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(255, 233, 215, 232),
                    ),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //image container
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: Color.fromARGB(255, 252, 223, 250)),
                            child: Image.asset(
                              blogs[index].imgpath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        //text container
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8),
                            // width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: Expanded(
                              child: Text(
                                blogs[index].blogsneakpeek,
                                softWrap: true,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Blogmodel {
  final String imgpath;
  final String blogsneakpeek;

  Blogmodel({required this.imgpath, required this.blogsneakpeek});
}
