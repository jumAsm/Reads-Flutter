import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/cubits/notes_cubit/notes_cubit.dart';
import 'package:reads/widget/icon_button_save.dart';
import 'package:reads/widget/readscustomfield.dart';
import 'package:reads/widget/shape_movie_ticket.dart';
import '../constants/colors.dart';
import '../models/read_model.dart';


class EditReadPage extends StatefulWidget {
  const EditReadPage({super.key, required this.reads});

  final ReadModel reads;

  @override
  State<EditReadPage> createState() => _EditReadPageState();
}

class _EditReadPageState extends State<EditReadPage> {
   String?  rtitle, rchapter, rnote;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              ShapeMovieTicket(
                reads: widget.reads,
              ),
              SizedBox(height: 10),

              // Title
              Container(
                alignment: Alignment(0, 0),
                child: Text(
                  widget.reads.titleRead,
                  style: GoogleFonts.mPlus1(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Chapter
              Container(
                alignment: Alignment(-0.95, 0),
                child: Text(
                  'Chapter',
                  style: GoogleFonts.mPlus1(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Read chapter field
              SizedBox(
                width: screenWidth * 0.9,
                child:  ReadsCustomField(
                    onChanged: (value){
                      rchapter = value;
                    },
                    hint: widget.reads.chapterRead,
                    borderClr: jgreen,
                    hintClr: jblack),
              ),
              const SizedBox(height: 15),

              // Notes
              Container(
                alignment: Alignment(-0.95, 0),
                child: Text(
                  'Notes',
                  style: GoogleFonts.mPlus1(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Read notes field
              SizedBox(
                width: screenWidth * 0.9,
                child:  ReadsCustomField(
                    onChanged: (value){
                      rnote = value;
                    },
                    hint: widget.reads.noteRead,
                    maxLines: 3,
                    borderClr: jyellow,
                    hintClr: jblack),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 8, right: 8),
        child: IconButtonSave(
          onPreesed: () {
            widget.reads.chapterRead = rchapter ?? widget.reads.chapterRead;
            widget.reads.noteRead = rnote ?? widget.reads.noteRead;
            widget.reads.save();
            BlocProvider.of<NotesCubit>(context).fetchAllReads();
            Navigator.pop(context);
            },
        ),
      ),
    );
  }
}
