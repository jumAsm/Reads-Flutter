import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/constants/colors.dart';
import 'package:reads/cubits/notes_cubit/notes_cubit.dart';
import 'package:reads/models/read_model.dart';
import 'package:reads/widget/icon_button_save.dart';
import 'package:reads/widget/readscustomfield.dart';
import 'package:reads/widget/shape_movie_ticket.dart';
import 'edit_page_status.dart';

class EditReadPage extends StatefulWidget {
  const EditReadPage({super.key, required this.reads});
  final ReadModel reads;

  @override
  State<EditReadPage> createState() => _EditReadPageState();
}

class _EditReadPageState extends State<EditReadPage> {
  String? rtitle, rchapter, rnote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backWhite,
      body: SafeArea(
        child: Column(
          children: [
            ShapeMovieTicket(reads: widget.reads),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text(
                            widget.reads.titleRead,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mPlus1(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      Container(
                        alignment: Alignment(-0.90, 0),
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
                      SizedBox(
                        width: 370,
                        child: ReadsCustomField(
                          onChanged: (value) {
                            rchapter = value;
                          },
                          borderClr: jgreen,
                          hint: widget.reads.chapterRead,
                          hintClr: Colors.black,
                          bWidth: 2.5,
                          textStyle: GoogleFonts.figtree(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      Container(
                        alignment: Alignment(-0.90, 0),
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
                      SizedBox(
                        width: 370,
                        child: ReadsCustomField(
                          onChanged: (value) {
                            rnote = value;
                          },
                          hint: widget.reads.noteRead,
                          borderClr: jyellow,
                          hintClr: Colors.black,
                          bWidth: 2.5,
                          textStyle: GoogleFonts.figtree(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      Container(
                        alignment: Alignment(-0.90, 0),
                        child: Text(
                          'Read Status',
                          style: GoogleFonts.mPlus1(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ColorsListViewEdit(
                        initialStatus: widget.reads.status,
                        onSelected: (label) {
                          widget.reads.status = label;

                          if (label == "Stopped") {
                            widget.reads.statusColor = jStopped.value;
                          } else if (label == "Completed") {
                            widget.reads.statusColor = jCompleted.value;
                          } else {
                            final List<Color> availableColors = [
                              jgreen,
                              jpink,
                              jyellow,
                              jblue,
                            ];
                            widget.reads.statusColor =
                                (availableColors.toList()..shuffle())
                                    .first
                                    .value;
                          }
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 8, right: 8),
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
