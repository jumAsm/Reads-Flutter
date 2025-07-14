import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
    width: 380,
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
    style: TextStyle(
    color: backWhite,
    ),
    decoration: InputDecoration(
    contentPadding: EdgeInsets.all(0),
    prefixIcon: Icon(
    Icons.search, color: Color(0xE5F9FBE7), size: 21,
    ),
    prefixIconConstraints: BoxConstraints(
    maxHeight: 20, minWidth: 25),
hintText: 'Look for a Read',
hintStyle: GoogleFonts.inter(
color: Color(0xE5F9FBE7),
fontSize: 16,
fontWeight: FontWeight.w500,
),
border: InputBorder.none,
),
),
);
  }
}

