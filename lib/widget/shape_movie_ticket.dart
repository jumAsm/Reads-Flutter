import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/constants/colors.dart';
import '../cubits/notes_cubit/notes_cubit.dart';
import '../models/read_model.dart';

class ShapeMovieTicket extends StatefulWidget {
  const ShapeMovieTicket({super.key, required this.reads});
  final ReadModel reads;

  @override
  _ShapeMovieTicketState createState() => _ShapeMovieTicketState();
}

class _ShapeMovieTicketState extends State<ShapeMovieTicket> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        ClipPath(
          clipper: MovieTicketClipper(),
          child: Container(
            height: 100,
            color: Colors.black,
          ),
        ),
        Center(
          child: Text(
            'Read Details',
            style: GoogleFonts.mPlus1(
              color: backWhite,
              fontSize: screenWidth * 0.075,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Positioned(
          right: 25,
          top: 29,
          child: Container(
            width: 40,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {
                widget.reads.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllReads();
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.delete,
                color: jblue,
                size: 25,
              ),
            ),
          ),
        ),
        Positioned(
          left: 25,
          top: 29,
          child: Container(
            width: 40,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite; // Toggle the favorite status
                });
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border, // Change icon based on isFavorite
                color: isFavorite ? Colors.pink : backWhite, // Change color based on isFavorite
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
