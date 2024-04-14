import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'second_dialog.dart';
import 'third_dialog.dart';

void firstpop(
    {required BuildContext context,
    required TextEditingController nameController,
    required TextEditingController messageController,
    required TextEditingController contactController}) {
  bool checkBox1 = false;
  bool checkBox2 = false;
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.grey[200],
        content: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: MediaQuery.of(context).size.width * 3,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "How would you like to post your story?",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 19),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(255, 244, 252, 1),
                          ),
                          height: 40,
                          child: Center(
                              child: Text("Annonymous",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)))),
                      const Spacer(
                        flex: 30,
                      ),
                      Checkbox(
                        value: checkBox1,
                        onChanged: (value) {
                          setState(() {
                            checkBox1 = value!;
                            checkBox2 = !value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 244, 252, 1),
                              borderRadius: BorderRadius.circular(10)),
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 40,
                          child: Center(
                              child: Text("With Your Information",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)))),
                      const Spacer(
                        flex: 30,
                      ),
                      Checkbox(
                        value: checkBox2,
                        onChanged: (value) {
                          setState(() {
                            checkBox2 = value!;
                            checkBox1 = !value;
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(219, 41, 191, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          checkBox1
                              ? thirdpop(
                                  context: context,
                                  nameController: nameController,
                                  contactController: contactController,
                                  messageController: messageController)
                              : checkBox2
                                  ? secondpop(
                                      context: context,
                                      nameController: nameController,
                                      messageController: messageController,
                                      contactController: contactController,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  : null;
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
            );
          },
        ),
      );
    },
  );
}
