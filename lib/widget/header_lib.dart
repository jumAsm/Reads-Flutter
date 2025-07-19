import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/constants/colors.dart';
import 'package:reads/widget/search_box.dart';
import '../home_page.dart';
import 'filter_body.dart';

class HeaderLib extends StatefulWidget {
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onFilterChanged;

  const HeaderLib({
    super.key,
    required this.onSearchChanged,
    required this.onFilterChanged,
  });

  @override
  _HeaderLibState createState() => _HeaderLibState();
}

class _HeaderLibState extends State<HeaderLib> {
  final TextEditingController searchController = TextEditingController();
  String selectedFilter = 'All';

  void _filterReads(String value) {
    widget.onSearchChanged(value.toLowerCase());
  }

  void _onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
    });
    widget.onFilterChanged(filter);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipPath(
          clipper: MovieTicketClipper(),
          child: Container(height: 210, color: Colors.black),
        ),
        Positioned(
          top: 20,
          child: Center(
            child: Text(
              'Reads Library',
              style: GoogleFonts.mPlus1(
                color: backWhite,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Positioned(
          top: 75,
          child: SearchBox(
            bClr: Colors.white,
            controller: searchController,
            onChanged: _filterReads,
          ),
        ),
        Positioned(
          top: 140,
          left: 20,
          right: 20,
          child: FilterBody(
            selectedFilter: selectedFilter,
            onFilterSelected: _onFilterSelected,
          ),
        ),
        Positioned(
          left: -8,
          top: 20,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false,
              );
            },
            icon: Icon(Icons.keyboard_arrow_left_outlined, color: backWhite, size: 30),
          ),
        ),
      ],
    );
  }
}
