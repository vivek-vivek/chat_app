import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/colors.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 275,
        decoration: BoxDecoration(
          color: Mycolors.white1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: 20,
          child: Center(
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusColor: Mycolors.purple,
                hintText: 'Serach People',
                hintStyle: GoogleFonts.lato(),
                prefixIcon: SizedBox(
                  height: 15,
                  width: 15,
                  child: Image.network(
                      "https://cdn-icons-png.flaticon.com/512/8915/8915520.png"),
                ),
              ),
            ),
          ),
        ));
  }
}
