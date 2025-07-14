import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:reads/constants/colors.dart';
import 'package:reads/models/read_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(ReadInitial());
List<ReadModel>?  notes;
  fetchAllReads() async
  {
      var readsBox = Hive.box<ReadModel>(kReadBox);

      notes = readsBox.values.toList();
      emit(ReadSuccess());
  }
}


