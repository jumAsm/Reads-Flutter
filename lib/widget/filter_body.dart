import 'package:flutter/material.dart';
import 'package:reads/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterBody extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterSelected;

  const FilterBody({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterItems(
            borderClr: jblue,
            item: 'All',
            onTap: () => onFilterSelected('All'),
            selected: selectedFilter == 'All',
          ),
          const SizedBox(width: 8),
          FilterItems(
            borderClr: jLike,
            item: 'Favourite',
            onTap: () => onFilterSelected('Favourite'),
            selected: selectedFilter == 'Favourite',
          ),
          const SizedBox(width: 8),
          FilterItems(
            borderClr: jyellow,
            item: 'On Going',
            fSize: 16,
            onTap: () => onFilterSelected('On Going'),
            selected: selectedFilter == 'On Going',
          ),
          const SizedBox(width: 8),
          FilterItems(
            borderClr: jgreen,
            item: 'Stopped',
            fSize: 16,
            onTap: () => onFilterSelected('Stopped'),
            selected: selectedFilter == 'Stopped',
          ),
          const SizedBox(width: 8),
          FilterItems(
            borderClr: jpink,
            item: 'Completed',
            fSize: 16,
            onTap: () => onFilterSelected('Completed'),
            selected: selectedFilter == 'Completed',
          ),
        ],
      ),
    );
  }
}

class FilterItems extends StatelessWidget {
  const FilterItems({
    super.key,
    required this.borderClr,
    required this.item,
    this.fSize = 18,
    required this.onTap,
    required this.selected,
  });

  final Color borderClr;
  final String item;
  final double fSize;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 119,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: borderClr,
            width: 2.2,
          ),
          color: selected ? borderClr : Colors.black,
        ),
        child: Center(
          child: Text(
            item,
            style: GoogleFonts.inter(
              color: selected ? Colors.black : borderClr,
              fontSize: fSize,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
