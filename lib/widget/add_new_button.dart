import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class  AddNewButton extends StatelessWidget {
  const AddNewButton({super.key, this.onTap, this.isLoading = false});

  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
   child:  Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
     color: backWhite,
     ),
       width: 358,  // 90% of screen width
       height: 45,
       child: Center(
         child: isLoading?  SizedBox(
           height: 25,
           width: 25,
           child: CircularProgressIndicator(
             color: Colors.black,
           ),
         ) :  Text(
           'Add Read',
            style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w600,
               ),
             ),
            ),),
          );
      }
}
