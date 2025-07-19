import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/constants/colors.dart';

class ReadsCustomField extends StatelessWidget {
  const ReadsCustomField({
    super.key,
    required this.hint,
    this.maxLines,
    required this.borderClr,
    required this.hintClr,
    this.onSaved,
    this.onChanged,
    this.viewText = false,
    this.fSize = 20,
    this.bWidth = 2,
    this.isRequired = true, this.textStyle,
  });

  final String hint;
  final int? maxLines;
  final Color borderClr, hintClr;
  final double fSize, bWidth;
  final bool viewText;
  final bool isRequired;
  final TextStyle? textStyle;


  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      readOnly: viewText,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (isRequired && (value?.isEmpty ?? true)) {
          return 'Please Enter Something';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      style: GoogleFonts.inter(
        color: hintClr,
        fontSize: fSize,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: jblue, width: bWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: borderClr, width: bWidth),
        ),
        hintText: hint,
        hintStyle: textStyle ??
        GoogleFonts.inter(
        color: hintClr,
        fontSize: fSize,
        fontWeight: FontWeight.w500,
      ),

    ),
    );
  }
}
