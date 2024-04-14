import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class cardBuilder extends StatelessWidget {
  const cardBuilder({super.key, required this.id, required this.message});
  final String id;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(255, 211, 243, 0.5)),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 5),
                child: Image.asset("assets/images/result9.png"),
              ),
              Text(id, style: GoogleFonts.inter(fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(message,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, fontSize: 14.5)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                  left: 5,
                ),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.grey[200],
                            content: SizedBox(
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Comment here...',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                    TextButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.comment),
                                        label: const Text('Comment'))
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: const Image(
                    width: 40,
                    height: 40,
                    image: AssetImage("images/message.png"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
