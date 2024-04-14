// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:silesua/pages/biography_description.dart';

class Biographies extends StatelessWidget {
  // final String imgpath;
  // final String name;
  Biographies({
    super.key,
    // required this.imgpath,
    // required this.name,
  });

  final List<Biomodel> biographies = [
    Biomodel(
        imgpath: 'images/img3.jpeg',
        name: 'Bethlehem Tilahun'),
    Biomodel(
        imgpath: 'assets/images/Abeba-Berhane.png',
        name: 'Scientist Abeba Birhane'),
    Biomodel(
        imgpath: 'assets/images/Meaza_Ashenafi.jpg', name: 'Meaza Ashenafi'),
    Biomodel(
        imgpath: 'assets/images/Derartu-Tulu.jpg',
        name: 'Colonel Derartu Tulu'),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: biographies.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BiographyDescription()));
          },
          child: Container(
            height: 150,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 233, 215, 232),
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
                          biographies[index].imgpath,
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      biographies[index].name,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
          ),
        );
      },
    ));
  }
}

class Biomodel {
  final String imgpath;
  final String name;

  Biomodel({required this.imgpath, required this.name});
}
