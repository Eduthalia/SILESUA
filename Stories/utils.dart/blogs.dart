import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Blogs extends StatelessWidget {
  final String imgpath;
  final String blogsneakpeek;

  const Blogs({super.key, required this.imgpath, required this.blogsneakpeek});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.45,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.pink.shade50,
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
                                color: Colors.pink.shade50),
                            child: Image.network(
                              imgpath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        //text container
                        Container(
                          margin: EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                            softWrap: true,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class Blogmodel {
  final String imgpath;
  final String blogsneakpeek;

  Blogmodel({required this.imgpath, required this.blogsneakpeek});
}
