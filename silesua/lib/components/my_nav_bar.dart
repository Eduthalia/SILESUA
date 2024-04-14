import 'package:flutter/material.dart';
// import 'package:silesua/pages/chat_pages.dart';
// import 'package:silesua/pages/consultant_chat_page.dart';
import 'package:silesua/pages/home_page.dart';
import 'package:silesua/pages/home_screen.dart';

import '../pages/consultant_page.dart';

class MyNavBar extends StatefulWidget {
  final int index;
  final Function(int)? onIndexChanged;

  const MyNavBar({Key? key, required this.index, this.onIndexChanged})
      : super(key: key);

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    Color unselectedColor = Colors.black;
    Color selectedColor = const Color.fromARGB(255, 221, 174, 229);

    return BottomNavigationBar(
      currentIndex: widget.index,
      unselectedItemColor: unselectedColor,
      selectedItemColor: selectedColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt),
          label: 'Communities',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone_callback),
          label: "Calls",
        ),
      ],
      onTap: (index) {
        if (widget.onIndexChanged != null) {
          widget.onIndexChanged!(index);
        }
        switch (index) {
          case 0:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            break;
          case 1:
           Navigator.push(
                context, MaterialPageRoute(builder: (context) => const HomePage2()));
            break;
          case 2:
           Navigator.push(
                context, MaterialPageRoute(builder: (context) => const ConsultantPage()));
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
          case 4:
            Navigator.pushReplacementNamed(context, '/calls');
            break;
        }
      },
    );
  }
}
