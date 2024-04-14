import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'third_dialog.dart';

void secondpop(
    {required BuildContext context,
    required Function() onPressed,
    required TextEditingController nameController,
    required TextEditingController messageController,
    required TextEditingController contactController}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.grey[200],
        content: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: MediaQuery.of(context).size.width * 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text("Fill in your information",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 20))),
              const SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.all(8),
                    label: Text("UserName",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 5,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: contactController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.all(8),
                    label: Text("Contact information",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(219, 41, 191, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (nameController.text.isNotEmpty ||
                          contactController.text.isNotEmpty) {
                        thirdpop(
                            context: context,
                            nameController: nameController,
                            contactController: contactController,
                            messageController: messageController);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('All field is required')));
                      }
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      );
    },
  );
}
