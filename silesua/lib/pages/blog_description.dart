import 'package:flutter/material.dart';

class BlogDescription extends StatefulWidget {
  const BlogDescription({Key? key});

  @override
  State<BlogDescription> createState() => _BlogDescriptionState();
}

class _BlogDescriptionState extends State<BlogDescription> {
  bool isLiked = false;
  bool isSaved = false;
  int shareCount = 0;
  int saveCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const Spacer(), // Add a spacer to push the next icon to the right
          IconButton(
            icon: const Icon(Icons.save_alt),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              const Text(
                "Blog Title",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    decorationStyle: TextDecorationStyle.solid),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset("images/img1.avif"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  "Women empowerment is a powerful movement that aims to create equal opportunities, rights, and representation for women in all spheres of life. It recognizes the inherent value and potential of women and seeks to eliminate the barriers that hinder their progress. In this blog, we will delve into the significance of women empowerment, its impact on society, and the strides being made to ensure a more equitable future for all.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  "Women empowerment encompasses a range of initiatives and actions aimed at enhancing women's social, economic, and political status. It involves providing women with access to education, healthcare, employment opportunities, and a seat in decision-making processes, enabling them to fulfill their aspirations and contribute meaningfully to society.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  "Empowering women is not just a matter of social justice; it is crucial for achieving sustainable development and creating a more prosperous and inclusive world. When women are empowered, they become agents of change, driving economic growth, nurturing healthier communities, and fostering innovation and creativity.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
      bottomNavigationBar: Container(
        height: 80, // Set the height of the container
        color: Colors.white, // Optional: Set background color
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: isLiked ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
                // Handle like button tap
              },
            ),
            IconButton(
              icon: const Icon(Icons.comment),
              color: Colors.black,
              onPressed: () {
                // Handle second icon tap
              },
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    setState(() {
                      shareCount++;
                    });
                  },
                ),
                Text(
                  shareCount.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.bookmark),
              color: isSaved ? Colors.purpleAccent : null,
              onPressed: () {
                setState(() {
                  isSaved = !isSaved;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
