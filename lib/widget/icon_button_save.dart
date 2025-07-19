import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class IconButtonSave extends StatelessWidget {
  const IconButtonSave({super.key, this.onPreesed});

  final void Function()? onPreesed;
  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: onPreesed,
      child: Container(
        width: 370,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            'Done',
            style: GoogleFonts.inter(
              color: backWhite,
              fontSize:22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
