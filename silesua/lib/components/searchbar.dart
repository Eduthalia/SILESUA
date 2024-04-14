import 'package:flutter/material.dart';

class searchbar extends StatelessWidget {
  const searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontFamily: 'BioRhyme'),
                        scrollPadding: EdgeInsets.all(0),
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          helperMaxLines: 1,
                          hintText: "Search here",
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 238, 53, 115),
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ]))
        ]));
  }
}
