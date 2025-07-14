import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reads/cubits/add_cubits/add_read_cubit.dart';
import 'package:reads/cubits/notes_cubit/notes_cubit.dart';
import 'add_read_form.dart';

class AddReadsBottomSheet extends StatelessWidget {
   const AddReadsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (context) => AddReadCubit(),
        child: Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BlocConsumer<AddReadCubit, AddReadState>(
        listener: (context, state){
          if(state is AddReadFailure){

          }
          if(state is AddReadSuccess){
            BlocProvider.of<NotesCubit>(context).fetchAllReads();
            Navigator.pop(context);
          }
        },
        builder: (context, state){
          return AbsorbPointer(
            absorbing: state is AddReadLoading ? true : false,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AddReadForm(),
            ),
          );
          },
      ),
    )
    );
  }
}


