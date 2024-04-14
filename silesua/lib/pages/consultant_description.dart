import 'package:flutter/material.dart';

import 'package:silesua/pages/consultant_page.dart';

class ConsultantDescription extends StatelessWidget {
  const ConsultantDescription({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Center(
          child: Text(
            "Dr. Mulu Mekonene",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        "assets/images/Mulu-Mkonnen.jpg",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Specialization",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Dr. Mulu Mekonene is a specialist in the medical field. He has a deep knowledge of the medical field and is able to solve complex medical problems.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Meseret Mulu Mekonen having outclassed 75 Doctors of Medicine has emerged as the most outstanding one with 3.54 CGPA. He can be called an accidental doctor, for he wanted to be an engineer, but it was his parents and school director, who diligently conspired to make medicine his first choice and there he is.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                          'Click here to see the pictures Meseret hails from Basoliben in east Gojjam, Amhara Region; his farmer father, Mulu Mekonen, owns 2 hectares of land, where he grows crops such as teff, maize, peas, beans, wheat, etc., and half of the produce is sold out for the upkeep of family; mother Mulu Enawgaw is a housewife and he is the eldest amongst five siblings;'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                          'his three sisters and one brother still pursuing school education.On schooling, he said, I did 10th and 12th Grades from Eyeb Secondary and Preparatory School and could score impressive GPA in 12th Grade; actually by then, I was nurturing a desire to be an engineer as mathematics and physics were my most favorite subjects, yet I scored pretty high in biology. But finally, wishes of my parents and director of school got materialized and now I am the Doctor of Medicine.My parents, he adds aren’t educated, they don’t know anything regarding medicine, what they aspire that after graduation, I should stay with them. I am the only graduate in my family; now I didn’t inform them that I topped the table, but have just invited them for graduation as I want to surprise them.'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 25.0,
            right: 16.0,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConsultantPage()),
                );
              },
              label: const Text('Chat with Consultants'),
              icon: const Icon(Icons.chat),
            ),
          ),
        ],
      ),
    );
  }
}
