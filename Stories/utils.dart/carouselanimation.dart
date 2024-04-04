import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderAnimation extends StatefulWidget {
  const CarouselSliderAnimation({super.key});

  @override
  State<CarouselSliderAnimation> createState() =>
      _CarouselSliderAnimationState();
}

class _CarouselSliderAnimationState extends State<CarouselSliderAnimation> {
  int _currentIndex = 0;
  final List<String> biographies = [
    'https://www.itu.int/en/ITU-D/Conferences/WTDC/WTDC21/R2A/PublishingImages/partner2connect/Sahle-Work-Zewde.png',
    'https://www.fanabc.com/english/wp-content/uploads/2023/09/Abeba-Berhane-450x300.png',
    'https://images.csmonitor.com/csm/2019/05/0520%20DDP%20ETHLADIES.jpg?alias=standard_900x600',
    'https://www.fanabc.com/english/wp-content/uploads/2023/04/photo_2023-04-27_16-48-37.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            enlargeFactor: 10,
            disableCenter: true,
            aspectRatio: 16 / 6,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: biographies.map((String url) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    color: Colors.blueGrey,
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.cover)),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: biographies.map((url) {
            int index = biographies.indexOf(url);
            return Container(
              width: 8.0,
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
