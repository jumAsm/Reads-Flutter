import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/widget/reads_list_view.dart';
import 'package:reads/widget/search_box.dart';

import 'cubits/notes_cubit/notes_cubit.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {

  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllReads();
    super.initState();
  }
//final ReadModel read;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Column(
      children: [
        SizedBox(height: 10),
        // Read Title
        Center(
          child: Text(
            'Reads',
            style: GoogleFonts.unbounded(
              color: Colors.black,
              fontSize: screenWidth * 0.075,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 10),
        SearchBox(),
        SizedBox(height: 15),
        // Previous Reads
        Container(
          alignment: Alignment(-0.95, 0),
          child: Text(
            'Previous Reads',
            style: GoogleFonts.mPlus1(
              fontSize: screenWidth * 0.06,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 5),
        Expanded(child: Readslistview()),
      ],
    );
  }
}