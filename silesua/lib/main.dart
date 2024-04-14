import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:silesua/pages/blog_description.dart';
import 'package:provider/provider.dart';
import 'package:silesua/firebase_options.dart';
import 'package:silesua/services/auth/auth_gate.dart';
import 'package:silesua/services/auth/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (create) => AuthServices(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:silesua/firebase_options.dart';
// import 'package:silesua/services/auth/auth_gate.dart';
// import 'package:silesua/services/auth/auth_services.dart';

// import 'pages/HomePage.dart';
// import 'pages/OnBoardingPage.dart';
// import 'pages/consultants.dart';
// import 'pages/contact_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   // Check if user is authenticated or not
//   bool isAuthenticated =
//       false; // Implement your logic to check authentication status here;

//   // Check if user has completed onboarding or not
//   bool hasCompletedOnboarding =
//       false; // Implement your logic to check onboarding status here;

//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => AuthServices(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         // Set the initial route based on authentication and onboarding status
//         initialRoute:
//             isAuthenticated && hasCompletedOnboarding ? '/main' : '/onboarding',
//         routes: {
//           '/main': (context) => MainScreen(),
//           '/onboarding': (context) => OnBoardingPage(),
//         },
//       ),
//     ),
//   );
// }

//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'pages/OnBoardingPage.dart';
// import 'pages/alert_page.dart';
// import 'pages/consultants.dart';
// import 'pages/contact_page.dart';
// import 'pages/home_page_main.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: OnBoardingPage(),
//         routes: {
//           '/main':(context) => MainScreen(),
//           '/home':(context) => HomePage(),
//           '/alert':(context) => AlertPage(),
//           // '/chats':(context) => ChatPage(),
//           // '/venting':(context) => VentingPage(),
//           '/contacts':(context) => ContactPage(),
//           '/consultants':(context) => Consultants(),
//         },
//     );
//   }
// }

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int myIndex = 0;
//   List<Widget> widgetList = [
//     HomePage(),
//     //ChatPage(),
//     Consultants(),
//     //VentingPage(),
//     ContactPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text(
//           "Silesua",
//           style: TextStyle(
//             fontFamily: 'BioRhyme',
//             fontWeight: FontWeight.bold,
//             fontSize: 30,
//             color: Color.fromARGB(255, 219, 41, 191),
//           ),
//         ),
//         actions: [
//           // IconButton(
//           //   icon: Icon(Icons.notifications_rounded),
//           //   onPressed: () {},
//           // ),
//           IconButton(
//             icon: Icon(
//               Icons.share_location,
//               color: Colors.red[900],
//             ),
//             onPressed: () {
//               Navigator.pushNamed(context, '/alert');
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: IndexedStack(
//           index: myIndex,
//           children: widgetList,
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         unselectedItemColor: Colors.black,
//         selectedItemColor: Color.fromARGB(255, 219, 41, 191),
//         onTap: (index) {
//           setState(() {
//             myIndex = index;
//           });
//         },
//         currentIndex: myIndex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message_rounded),
//             label: 'Message',
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person_pin_circle), label: 'Consultants'),
//           BottomNavigationBarItem(icon: Icon(Icons.group_add), label: 'Vent'),
//           BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Contacts'),
//         ],
//       ),
//     );
//   }
// }
