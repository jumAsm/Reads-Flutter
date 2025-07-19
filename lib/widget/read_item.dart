import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/constants/colors.dart';
import 'package:reads/models/read_model.dart';
import 'package:reads/widget/edit_read_page.dart';

class ReadItem extends StatelessWidget {
  const ReadItem({super.key, required this.read});
  final ReadModel read;

  @override
  Widget build(BuildContext context) {
    Widget leadingWidget;

    if (read.status == 'Completed') {
      leadingWidget = checkRead();
      if (read.isFavorite) {
        leadingWidget = likedRead();
      }
    } else if (read.status == 'Stopped') {
      leadingWidget = stopRead();
    } else if (read.status == 'On Going' && read.isFavorite) {
      leadingWidget = likedRead();
    } else {
      leadingWidget = SizedBox(
        height: 55,
        width: 55,
        child: Center(
          child: Image.asset(
            'lib/assets/flowerShap.png',
            height: 45,
            width: 45,
          ),
        ),
      );
    }

    final textColor = (read.status == 'Completed' || read.status == 'Stopped')
        ? backWhite
        : Colors.black;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditReadPage(reads: read)),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Color(read.statusColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            ListTile(
              leading: leadingWidget,
              title: Text(
                read.titleRead,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
              trailing: Text(
                read.chapterRead,
                style: GoogleFonts.figtree(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget checkRead() {
  return SizedBox(
    width: 55,
    height: 55,
    child: Center(
      child: (Image.asset('lib/assets/completed.png', height: 40, width: 40)),
    ),
  );
}

Widget stopRead() {
  return SizedBox(
    width: 55,
    height: 55,
    child: Center(child: Icon(Icons.stop_circle, size: 40, color: backWhite)),
  );
}

Widget likedRead() {
  return SizedBox(
    width: 56,
    height: 56,
    child: Center(child: Icon(Icons.favorite, size: 40, color: jLike)),
  );
}
