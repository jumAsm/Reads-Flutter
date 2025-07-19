import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/constants/colors.dart';
import '../cubits/notes_cubit/notes_cubit.dart';
import '../home_page.dart';
import '../models/read_model.dart';
import 'package:flutter/cupertino.dart';

class ShapeMovieTicket extends StatefulWidget {
  const ShapeMovieTicket({super.key, required this.reads});
  final ReadModel reads;

  @override
  _ShapeMovieTicketState createState() => _ShapeMovieTicketState();
}

class _ShapeMovieTicketState extends State<ShapeMovieTicket> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.reads.isFavorite;
  }

  void _confirmDelete(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Delete Confirmation'),
        content: const Text('Are you sure you want to delete this read?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Delete'),
            onPressed: () {
              Navigator.pop(context);
              widget.reads.delete();
              BlocProvider.of<NotesCubit>(context).fetchAllReads();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipPath(
          clipper: MovieTicketClipper(),
          child: Container(height: 100, color: Colors.black),
        ),
        Center(
          child: Text(
            'Read Details',
            style: GoogleFonts.mPlus1(
              color: backWhite,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 32,
          child: Container(
            width: 40,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () => _confirmDelete(context),
              icon: Icon(Icons.delete, color: jblue, size: 25),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 30,
          child: Container(
            width: 40,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
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
        ),
        Positioned(
          right: 45,
          top: 32,
          child: Container(
            width: 35,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                  widget.reads.isFavorite = isFavorite;
                  widget.reads.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllReads();
                });
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.pink : backWhite,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
