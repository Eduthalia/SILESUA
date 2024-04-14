import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silesua/pages/ai_chat_screen.dart';
import '../services/auth/auth_services.dart';
import 'chat_pages.dart';
import 'search_page.dart';

class ConsultantPage extends StatefulWidget {
  const ConsultantPage({super.key});

  @override
  State<ConsultantPage> createState() => _ConsultantPageState();
}

class _ConsultantPageState extends State<ConsultantPage> {
  // ignore: unused_field
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void signOut() {
    final authService = Provider.of<AuthServices>(context, listen: false);
    authService.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Silesua",
          style: TextStyle(
            color: Color.fromARGB(255, 158, 43, 187),
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ChatScreen())));
            },
            icon: const Icon(Icons.android), // Bell icon
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchPage()));
            },
            icon: const Icon(Icons.search_rounded), // Books icon
          ),
        ],
      ),
      // body: _buildUserList(),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add your horizontal elements here
                Center(
                  child: Text(
                    'Chat With Consultants ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                        // textAlign: TextAlign.center,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: _buildUserList(),
          ),
        ],
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshots) {
        if (snapshots.hasError) {
          return const Text("Error");
        }
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        final filteredDocs = snapshots.data!.docs.where((doc) {
          Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
          final email = data['email'] as String;
          return email.endsWith('@admin.com');
        }).toList();
        return ListView(
          children: filteredDocs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (_auth.currentUser!.email != data['email']) {
      return Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 25.0,
              // We can replace 'profileImageUrl' with the actual field in our Firestore document that contains the URL/ the name(incase of ImageProvider<Objet>) of the profile picture
              //backgroundImage: NetworkImage("https://uxwing.com/woman-female-icon/" ?? ''),
              backgroundColor: Color.fromARGB(255, 228, 183, 235),
            ),
            title: Text(
              data['email'],
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Poppins',
                letterSpacing: 1,
                wordSpacing: 1,
                height: 1.5,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChatPage(
                      reciverUserEmail: data['email'],
                      reciverUserID: data['uid'],
                    );
                  },
                ),
              );
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 228, 183, 235),
            height: 30,
            // thickness: 5,
            indent: 20,
            endIndent: 20,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
