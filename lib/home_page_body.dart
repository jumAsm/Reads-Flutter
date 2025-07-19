import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/widget/library_page.dart';
import 'package:reads/widget/reads_list_view.dart';
import 'package:reads/widget/search_box.dart';
import 'cubits/notes_cubit/notes_cubit.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final TextEditingController searchController = TextEditingController();
  String currentSearchText = '';

  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllReads();
    super.initState();
  }

  void _filterReads(String value) {
    setState(() {
      currentSearchText = value.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reads',
                style: GoogleFonts.unbounded(
                  color: Colors.black,
                  fontSize: 33,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LibraryPage()),
                  );
                },
                icon: Image.asset(
                  'lib/assets/shelf.png',
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 15),
        SearchBox(
          controller: searchController,
          onChanged: _filterReads,
        ),
        const SizedBox(height: 20),
        Container(
          alignment: const Alignment(-0.9, 0),
          child: Text(
            'Previous Reads',
            style: GoogleFonts.mPlus1(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: Readslistview(searchQuery: currentSearchText),
        ),
      ],
    );
  }
}
