import 'package:flutter/material.dart';

class Biographies extends StatelessWidget {
  final String imgpath;
  final String name;
  Biographies({
    super.key,
    required this.imgpath,
    required this.name,
  });

  final List<Biomodel> biographies = [
    Biomodel(
        imgpath:
            'https://www.itu.int/en/ITU-D/Conferences/WTDC/WTDC21/R2A/PublishingImages/partner2connect/Sahle-Work-Zewde.png',
        name: 'President SahleWork Zewdie'),
    Biomodel(
        imgpath:
            'https://www.fanabc.com/english/wp-content/uploads/2023/09/Abeba-Berhane-450x300.png',
        name: 'Scientist Abeba irhane'),
    Biomodel(
        imgpath:
            'https://images.csmonitor.com/csm/2019/05/0520%20DDP%20ETHLADIES.jpg?alias=standard_900x600',
        name: 'Meaza Ashenafi'),
    Biomodel(
        imgpath:
            'https://www.fanabc.com/english/wp-content/uploads/2023/04/photo_2023-04-27_16-48-37.jpg',
        name: 'Derartu Tulu'),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.pink.shade50),
                  child: Stack(
                    children: <Widget>[
                      // Image as background
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            imgpath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Text widget stacked over the image
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Colors.pink.shade200.withOpacity(0.5),
                                  Colors.pink.shade100.withOpacity(0.5),
                                  Colors.pink.shade50.withOpacity(0.5),
                                ]),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

class Biomodel {
  final String imgpath;
  final String name;

  Biomodel({required this.imgpath, required this.name});
}
