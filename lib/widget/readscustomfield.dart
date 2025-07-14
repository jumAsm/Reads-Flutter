import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/constants/colors.dart';

class ReadsCustomField extends StatelessWidget {
  const ReadsCustomField({
    super.key, required this.hint, this.maxLines = 1, required this.borderClr,
     required this.hintClr, this.onSaved, this.onChanged, this.viewText = false});

  final String hint;
  final int maxLines;
  final Color borderClr, hintClr;
  final bool viewText;

  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextFormField(
      readOnly: viewText,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if(value?.isEmpty ?? true){
          return 'Please Enter Something';
        }else{
          return null;
        }
      },
      maxLines: maxLines,
      style: GoogleFonts.inter(
        color: hintClr,
        fontSize: screenWidth * 0.04,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: jblue,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: borderClr,
            width: 2.0,
          ),
        ),
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          color: hintClr,
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
