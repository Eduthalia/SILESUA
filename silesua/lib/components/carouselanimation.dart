// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderAnimation extends StatefulWidget {
  const CarouselSliderAnimation({Key? key}) : super(key: key);

  @override
  State<CarouselSliderAnimation> createState() =>
      _CarouselSliderAnimationState();
}

class _CarouselSliderAnimationState extends State<CarouselSliderAnimation> {
  int _currentIndex = 0;

  final List<String> carousel_img = [
    'assets/images/mita.webp',
    'assets/images/womenMH.webp',
    'assets/images/waisa_1.webp',
    'assets/images/ethiowoman.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            enlargeFactor: 12,
            disableCenter: true,
            aspectRatio: 18 / 8,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: carousel_img.map((String url) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey,
                image: DecorationImage(
                  image: AssetImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: carousel_img.map((url) {
            int index = carousel_img.indexOf(url);
            return Container(
              width: 12.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? const Color.fromARGB(255, 238, 53, 115)
                    : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}