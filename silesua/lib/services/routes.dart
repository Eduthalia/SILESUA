import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silesua/pages/consultant_page.dart';
import 'package:silesua/pages/home_page.dart';
import 'package:silesua/pages/home_page_main.dart';
import 'package:silesua/pages/home_screen.dart';

import '../pages/OnBoardingPage.dart';
import '../pages/alert_page.dart';
import '../pages/consultants.dart';
import '../pages/contact_page.dart';
import 'auth/auth_services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoardingPage(),
      routes: {
        '/main': (context) => const MainScreen(),
        '/home': (context) => const HomePage(),
        '/alert': (context) => const AlertPage(),
        '/chats': (context) => const HomePage2(),
        '/venting': (context) => const HomeScreen(),
        '/contacts': (context) => ContactPage(),
        '/consultants': (context) => const ConsultantPage(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int myIndex = 0;
  List<Widget> widgetList = [
    const HomePage(),
    const HomePage2(),
    const Consultants(),
    const HomeScreen(),
    ContactPage(),
  ];
  void signOut() {
    final authService = Provider.of<AuthServices>(context, listen: false);
    authService.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Silesua",
              style: TextStyle(
                fontFamily: 'BioRhyme',
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromARGB(255, 219, 41, 191),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: signOut,
          ),
          IconButton(
            icon: Icon(
              Icons.share_location,
              color: Colors.red[900],
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AlertPage()));
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: myIndex,
        children: widgetList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 219, 41, 191),
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: 'Message',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle), label: 'Consultants'),
          BottomNavigationBarItem(icon: Icon(Icons.group_add), label: 'Vent'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Contacts'),
        ],
      ),
    );
  }
}
