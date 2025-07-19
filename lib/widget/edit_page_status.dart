import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class ColorItemEdit extends StatelessWidget {
  const ColorItemEdit({
    super.key,
    required this.isPicked,
    required this.color,
    required this.label,
  });

  final bool isPicked;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 54,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: backWhite,
            border: Border.all(
              color: isPicked ? jblue : jpink,
              width: isPicked ? 3 : 2,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 18,
                fontWeight: isPicked? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorsListViewEdit extends StatefulWidget {
  final Function(String label) onSelected;
  final String initialStatus;

  const ColorsListViewEdit({
    super.key,
    required this.onSelected,
    required this.initialStatus,
  });

  @override
  State<ColorsListViewEdit> createState() => _ColorsListViewEditState();
}

class _ColorsListViewEditState extends State<ColorsListViewEdit> {
  int currentIndex = -1;

  final List<Color> colors = [
    backWhite,
    backWhite,
    backWhite,
  ];

  final List<String> labels = [
    'On Going',
    'Stopped',
    'Completed',
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = labels.indexOf(widget.initialStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(labels.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
            widget.onSelected(labels[index]);
          },
          child: ColorItemEdit(
            color: colors[index],
            isPicked: currentIndex == index,
            label: labels[index],
          ),
        );
      }),
    );
  }
}
