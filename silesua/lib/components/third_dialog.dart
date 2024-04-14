// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:silesua/model/vent.dart';
import 'package:silesua/services/firestore/firestore.dart';

void thirdpop({
  required BuildContext context,
  required TextEditingController nameController,
  required TextEditingController messageController,
  required TextEditingController contactController,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.grey[100],
        content: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: MediaQuery.of(context).size.width * 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text("Write you story in less than 200 words",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 17.86))),
              const SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 7,
                controller: messageController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(8),
                  hintText: 'Write your message here...',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(219, 41, 191, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextButton(
                    onPressed: () {
                      // firebase here
                      if (messageController.text.isNotEmpty) {
                        nameController.clear();
                        contactController.clear();
                        messageController.clear();
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('All field is required')));
                      }
                    },
                    child: GestureDetector(
                      onTap: () {
                        // ignore: no_leading_underscores_for_local_identifiers
                        FireStoreServices _firestoreservices =
                            FireStoreServices();
                        _firestoreservices.add(nameController.text,
                            contactController.text, messageController.text);
                        messageController.clear();
                      },

                      // onTap: () async {
                      //   // ignore: no_leading_underscores_for_local_identifiers
                      //   final FirebaseFirestore _firestore =
                      //       FirebaseFirestore.instance;
                      //   // ignore: no_leading_underscores_for_local_identifiers
                      //   final FirebaseAuth _firebaseAuth =
                      //       FirebaseAuth.instance;
                      //   try {
                      //     // Get current user info
                      //     final String currentUserId =
                      //         _firebaseAuth.currentUser!.uid;
                      //     final String currentUserEmail =
                      //         _firebaseAuth.currentUser!.email.toString();
                      //     final Timestamp timestamp = Timestamp.now();

                      //     // Create the new message
                      //     Vent newMessage = Vent(
                      //       senderId: nameController.text,
                      //       senderEmail: contactController.text,
                      //       timestamp: timestamp,
                      //       message: messageController.text,
                      //     );

                      //     // Construct chat room id from the current user id and receiver id to ensure uniqueness
                      //     List<String> ids = [
                      //       currentUserId,
                      //     ];
                      //     ids.sort();
                      //     String ventId = ids.toString();

                      //     // Add the message to the database
                      //     await _firestore
                      //         .collection("vents")
                      //         .doc(ventId)
                      //         .collection('ventMessages')
                      //         .add(newMessage.toMap());

                      //     // Getting the messages
                      //     messageController.clear();
                      //   } catch (error) {
                      //     // ignore: avoid_print
                      //     print('Error sending message: $error');
                      //   }
                      // },
                      child: const Text(
                        "Post",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              )
            ],
          ),
        ),
      );
    },
  );
}
