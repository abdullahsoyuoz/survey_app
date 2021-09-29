import 'package:anketapp/Utility/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

Widget emptyWidget(String message) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Lottie.network(
          'https://assets5.lottiefiles.com/packages/lf20_fyqtse3p.json',
          fit: BoxFit.fitHeight,
          width: 50),
      FittedBox(
        fit: BoxFit.fitWidth,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            right: 8.0,
          ),
          child: Text(
            '$message',
            style: GoogleFonts.roboto(
              color: AppColors.appColorBlueDark,
            ),
          ),
        ),
      )
    ],
  );
}
