// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/card_builder.dart';
import '../components/first_dialog.dart';
import '../services/auth/auth_services.dart';
import '../services/chats/chat_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messagecontroller = TextEditingController();
  final TextEditingController _contactcontroller = TextEditingController();
  void signOut() {
    final authService = Provider.of<AuthServices>(context, listen: false);
    authService.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Image(image: AssetImage("images/Rectangle28.png")),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Your voice matters. Speak, and let the healing begin",
                  style: GoogleFonts.indieFlower(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(95, 15, 82, 1),
                    ),
                  ),
                ),
              ),
              const cardBuilder(
                id: "ID-4356",
                message:
                    "I lived in fear, trapped in a cycle of abuse by my husband. But one night, I made a daring decision to escape.Will he find ou? If so what’s gonna happen to me?",
              ),
              const cardBuilder(
                  id: "ID-4351",
                  message:
                      "Rape tore apart my world, but I'm piecing myself back together, stronger and more resilient than ever before."),
              const cardBuilder(
                  id: "ID-4350",
                  message:
                      "In the haunting silence that followed, I grappled with the agony of betrayal, my innocence stolen by the cruel hands of violence, leaving scars etched deep within my soul, yet determined to reclaim my voice and stand as a beacon of hope for those still trapped in the darkness of their own despair."),
              //_buildMessageList(),
              // SizedBox(
              //     height: 400,
              //     width: double.infinity,
              //     child: _buildMessageList()),
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('vents').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> documents = snapshot.data!.docs;
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 0), // Adjust the left padding as needed
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: documents.map((document) {
                          String id = document['venterId'];
                          String message = document['ventMessage'];
                          return cardBuilder(id: id, message: message);
                        }).toList(),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),

              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () {
            firstpop(
                context: context,
                nameController: _nameController,
                contactController: _contactcontroller,
                messageController: _messagecontroller);
          },
          child: Image.asset(
            'images/plus.webp',
            width: 50,
            height: 50,
          )),
    );
  }
}

Widget _buildMessageList() {
  final ChatServices _chatServices = ChatServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  return StreamBuilder(
      stream: _chatServices.getVents(_firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      });
}

//message item builder
Widget _buildMessageItem(DocumentSnapshot document) {
  Map<String, dynamic> data = document.data() as Map<String, dynamic>;
  return Padding(
    padding: const EdgeInsets.all(0.0),
    child: Column(
      children: [
        // Text(data['senderEmail']),
        const SizedBox(
          height: 10,
        ),
        cardBuilder(id: data['venterId'], message: data['ventMessage']),
      ],
    ),
  );
}
