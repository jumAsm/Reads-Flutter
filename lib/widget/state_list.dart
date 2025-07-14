import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/cubits/add_cubits/add_read_cubit.dart';

import '../constants/colors.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isPicked, required this.color, required this.label});
  final bool isPicked;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.0),
        child: Container(
          decoration: BoxDecoration(
            color: isPicked ? Colors.black : color,
            border: Border.all(
              color: isPicked ? jblue : backWhite ,
              width: 1.7,
            ),
            borderRadius: BorderRadius.circular(14.0),
          ),
          height: 32,
          width: 165,
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: backWhite,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = -1;

  List<Color> colors = [
    Colors.black,
    Colors.black
  ];
  List<String> labels = [
    'On Going',
    'Completed',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: SingleChildScrollView(
        child: Row(
          children: List.generate(colors.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: ColorItem(
                color: colors[index],
                isPicked: currentIndex == index,
                label: labels[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}
