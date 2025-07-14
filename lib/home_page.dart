import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/widget/add_read_bottom_sheet.dart';
import 'home_page_body.dart';
import '../constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: backWhite,
      floatingActionButton: FloatingActionButton.extended(
      backgroundColor: Colors.black,
      onPressed: () {
      showModalBottomSheet(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
      top: Radius.circular(20),
      ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.black,
      context: context,
      isScrollControlled: true,
      builder: (context) {
      return AddReadsBottomSheet();
      },
      );
      },
      label: Text(
      'Add a Read',
      style: GoogleFonts.lexend(
      color: backWhite,
      fontSize: screenWidth * 0.045,
      fontWeight: FontWeight.w400,
      ),
      ),
      icon: const Icon(
      Icons.add,
      color: backWhite,
      size: 23,
      ),
      ),
      body: SafeArea(
      child: HomePageBody(),
      ),);
  }
  }

