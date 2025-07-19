import 'package:flutter/material.dart';
import 'package:reads/widget/add_read_bottom_sheet.dart';
import 'package:reads/widget/library_page.dart';
import 'home_page_body.dart';
import '../constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePageBody(),
    LibraryPage(),
  ];

  void _openAddReadModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.black,
      isScrollControlled: true,
      builder: (context) => const AddReadsBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backWhite,
      body: SafeArea(child: _pages[_selectedIndex]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: _openAddReadModal,
          icon: Image.asset(
            'lib/assets/icon_add.png',
            width: 20,
            height: 20,
          ),
          label:  Text(
            'Add New Read',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color: backWhite,
              fontSize: 16,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}
