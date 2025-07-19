import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reads/cubits/add_cubits/add_read_cubit.dart';
import 'package:reads/models/read_model.dart';
import 'package:reads/widget/readscustomfield.dart';
import 'package:reads/widget/state_list.dart';
import '../constants/colors.dart';
import 'add_new_button.dart';

class AddReadForm extends StatefulWidget {
  const AddReadForm({super.key});

  @override
  State<AddReadForm> createState() => _AddReadFormState();
}

class _AddReadFormState extends State<AddReadForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? titleRead, chapterRead, noteRead;
  String selectedState = 'On Going';

  List<Color> ongoingColors = [jgreen, jpink, jyellow, jblue];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 25),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Title',
              style: GoogleFonts.mPlus1(
                color: backWhite,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ReadsCustomField(
            onSaved: (value) {
              titleRead = value;
            },
            hint: 'Read Title',
            borderClr: jpink,
            hintClr: Color(0xCDFFFFFF),
            fSize: 16,
          ),
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Chapter',
              style: GoogleFonts.mPlus1(
                color: backWhite,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ReadsCustomField(
            onSaved: (value) {
              chapterRead = value;
            },
              borderClr: jyellow,
              hintClr: Color(0xCDFFFFFF),
            hint: 'Read Chapter',
            textStyle: GoogleFonts.figtree(
            color: Color(0xCDFFFFFF),
            fontSize: 18,)
          ),
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Notes',
              style: GoogleFonts.mPlus1(
                color: backWhite,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ReadsCustomField(
            onSaved: (value) {
              noteRead = value;
            },
            hint: 'Talk about the Read',
            maxLines: 2,
            borderClr: jgreen,
            hintClr: Color(0xCDFFFFFF),
            fSize: 16,
            isRequired: false,
          ),
          const SizedBox(height: 25),
          ColorsListView(
            onSelected: (label) {
              selectedState = label;
            },
          ),
          const SizedBox(height: 20),
          BlocBuilder<AddReadCubit, AddReadState>(
            builder: (context, state) {
              return AddNewButton(
                isLoading: state is AddReadLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      Color selectedColor = selectedState == 'Completed'
                          ? jCompleted
                          : (ongoingColors..shuffle()).first;

                      var rModel = ReadModel(
                        titleRead: capitalizeEachWord(titleRead!),
                        chapterRead: chapterRead!,
                        noteRead: noteRead!,
                        color: selectedColor.value,
                        status: selectedState,
                        statusColor: selectedState == 'Completed'
                            ? jCompleted.value
                            : selectedColor.value,
                        isFavorite: false,
                      );

                      BlocProvider.of<AddReadCubit>(context).addReed(rModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }

              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
String capitalizeEachWord(String input) {
  return input.split(' ').map((word) {
    if (word.isEmpty) return '';
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join(' ');
}
