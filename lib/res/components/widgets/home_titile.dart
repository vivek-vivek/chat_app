import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/colors.dart';

class TitleHead extends StatelessWidget {
  const TitleHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 30),
      child: Center(
        child: Text(
          'Messanger',
          style: GoogleFonts.justAnotherHand(
            color: Mycolors.purple,
            fontSize: 50,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
