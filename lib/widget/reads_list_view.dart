import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reads/constants/colors.dart';
import 'package:reads/cubits/notes_cubit/notes_cubit.dart';
import 'package:reads/models/read_model.dart';
import 'package:reads/widget/read_item.dart';

class Readslistview extends StatelessWidget {
  final String searchQuery;
  final String selectedFilter;

  const Readslistview({
    super.key,
    this.searchQuery = '',
    this.selectedFilter = 'All',
  });

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [jgreen, jpink, jyellow, jblue];

    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<ReadModel> notes = BlocProvider.of<NotesCubit>(context).notes ?? [];

        List<ReadModel> filteredNotes = notes.where((note) {
          final matchSearch = note.titleRead.toLowerCase().contains(searchQuery.toLowerCase());
          switch (selectedFilter) {
            case 'Favourite':
              return note.isFavorite && matchSearch;
            case 'Completed':
              return note.status == 'Completed' && matchSearch;
            case 'Stopped':
              return note.status == 'Stopped' && matchSearch;
            case 'On Going':
              return note.status == 'On Going' && matchSearch;
            case 'All':
            default:
              return matchSearch;
          }
        }).toList().reversed.toList();

        int colorIndex = 0;

        return Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: ListView.builder(
            itemCount: filteredNotes.length,
            itemBuilder: (context, index) {
              final note = filteredNotes[index];

              Color assignedColor;
              if (note.status == 'Completed') {
                assignedColor = jCompleted;
              } else if (note.status == 'Stopped') {
                assignedColor = jStopped;
              } else {
                assignedColor = colors[colorIndex % colors.length];
                colorIndex++;
              }

              note.statusColor = assignedColor.value;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ReadItem(read: note),
              );
            },
          ),
        );
      },
    );
  }
}
