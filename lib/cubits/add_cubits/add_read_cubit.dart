import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:reads/constants/colors.dart';
import 'package:reads/models/read_model.dart';
part 'add_read_state.dart';

class AddReadCubit extends Cubit<AddReadState>{
  AddReadCubit() : super(AddReadInitial());

  addReed(ReadModel read) async {
    //read.color = color.value;

    emit(AddReadLoading());
    try {
      var readsBox = Hive.box<ReadModel>(kReadBox);
      await readsBox.add(read);
      emit(AddReadSuccess());
    } catch(e) {
      emit(AddReadFailure(e.toString()));
    }
  }
}