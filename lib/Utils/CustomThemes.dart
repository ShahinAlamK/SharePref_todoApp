import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Color kWhite=Color(0xffffffff);
Color kBlack=Color(0xff000000);
Color kprimary = Color(0xff17202a);
Color ksecondary = Color(0xff1c2833);
Color kaccent = Color(0xFF2e4053);
Color kOffweit = Color(0xFFbfc9ca);
Color kDColor = Color(0x6a22285f);
Color kLColor = Color(0xf2ff5d05);


SystemUiOverlayStyle systemUiOverlayStyle=SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark
);



class CustomTheme{

  ThemeData lightTheme=ThemeData(
    primaryColor: kWhite,
    scaffoldBackgroundColor: kWhite,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: kWhite,
      brightness: Brightness.light,
      secondary: kBlack,
      onPrimary: kOffweit,
      primaryVariant: kLColor,
    ),

    textTheme: TextTheme(
      bodyText1: GoogleFonts.raleway(fontSize: 14,color:kaccent,fontWeight: FontWeight.bold),
      bodyText2: GoogleFonts.roboto(fontSize: 16,color:kOffweit,fontWeight: FontWeight.bold),
      headline6: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold)
    ),

    appBarTheme: AppBarTheme(
      centerTitle: false,
      //titleSpacing: 0,
      iconTheme: IconThemeData(color: kBlack),
      elevation: 0,
      backgroundColor:kWhite
    ),
  );

  ThemeData darkTheme=ThemeData(
    primaryColor: kprimary,
    scaffoldBackgroundColor: kprimary,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        primary: kprimary,
        brightness: Brightness.dark,
        secondary: kaccent,
        onPrimary: kaccent,
      primaryVariant: kDColor,
    ),

    textTheme: TextTheme(
        bodyText1: GoogleFonts.raleway(fontSize: 14,color:kOffweit,fontWeight: FontWeight.bold),
        bodyText2: GoogleFonts.roboto(fontSize: 16,color:kOffweit,fontWeight: FontWeight.bold),
        headline6: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold)
    ),

    appBarTheme: AppBarTheme(
        centerTitle: false,
        //titleSpacing: 0,
        iconTheme: IconThemeData(color: kWhite),
        elevation: 0,
        backgroundColor:kprimary
    ),
  );
}