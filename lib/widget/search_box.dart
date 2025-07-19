import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const SearchBox({
    super.key,
    required this.controller,
    required this.onChanged,  this.bClr = Colors.black,
  });
  final Color bClr;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 44,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: bClr
        )
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: backWhite),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          prefixIcon: Icon(Icons.search, color: searchWhite, size: 21),
          prefixIconConstraints: const BoxConstraints(maxHeight: 20, minWidth: 25),
          hintText: 'Look for a Read',
          hintStyle: GoogleFonts.inter(
            color: searchWhite,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
         border: InputBorder.none,
        ),

      ),
    );
  }
}
