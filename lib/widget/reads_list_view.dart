import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reads/cubits/notes_cubit/notes_cubit.dart';
import 'package:reads/models/read_model.dart';
import 'package:reads/widget/read_item.dart';
import 'package:reads/constants/colors.dart';

class Readslistview extends StatelessWidget {
  const Readslistview({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      jgreen,
      jpink,
      jyellow,
      jblue,
    ];
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {

        List<ReadModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
           padding: EdgeInsets.only(bottom: 15),
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                Color selectedColor = colors[index % colors.length];
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ReadItem(
                      s: selectedColor,
                      read: notes[index],),
                );
              },
          ),
        );
      }
    );

    }
}
