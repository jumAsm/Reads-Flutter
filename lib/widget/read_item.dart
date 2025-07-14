import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/models/read_model.dart';
import 'package:reads/widget/edit_read_page.dart';

class ReadItem extends StatelessWidget {

  const ReadItem({super.key, required this.read, required this.s});
 final Color s;
  final ReadModel read;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditReadPage(
                reads: read,
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2, top: 2, left: 8, right: 8),
        padding: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: s,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset('lib/assets/flowerShap.png'),
              title: Text(
                read.titleRead,
                style: GoogleFonts.inter(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                read.chapterRead,
                style: GoogleFonts.inter(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: screenWidth * 0.05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
