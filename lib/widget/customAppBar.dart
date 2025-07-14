import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(height: 60),
        // Title
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Read Details...',
            style: GoogleFonts.mPlus1(
              color: Colors.black,
              fontSize: screenWidth * 0.075,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
