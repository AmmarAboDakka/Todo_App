

import 'package:flutter/material.dart';
import 'package:todo_app/shared/style/colors.dart';

class Mytheme{

  static ThemeData lihgttheme=ThemeData(

    primaryColor: primaryorangcolor,
   scaffoldBackgroundColor:backgroundcolor,
   colorScheme: ColorScheme(
       brightness: Brightness.light,
       primary: primaryorangcolor,
       onPrimary: whitecolor,
       secondary: backgroundcolor,
       onSecondary: whitecolor,
       error: Colors.red,
       onError: whitecolor,
       background: backgroundcolor,
       onBackground: blackcolor,
       surface: Colors.black,
       onSurface: primaryorangcolor),


    appBarTheme:  AppBarTheme(
      // color:whitecolor,
            backgroundColor: primaryorangcolor,

          ),
      textTheme: const TextTheme(

      headline1:TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
          color: Colors.black
      ),
          headline2: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        subtitle1:TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
        subtitle2:TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.orange
        ),
  ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(

      unselectedIconTheme: IconThemeData(color: Colors.grey,size: 30),
      selectedIconTheme: IconThemeData(color: Colors.orange,size: 30),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darksecondcolor
    )
  );
  static ThemeData darktheme=ThemeData(

      primaryColor: primaryorangcolor,

      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.orange,
          onPrimary: whitecolor,
          secondary: blackcolor,
          onSecondary: whitecolor,
          error: Colors.red,
          onError: whitecolor,
          background: Colors.transparent,
          onBackground: Colors.transparent,
          surface: whitecolor,
          onSurface: whitecolor),

      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        // color:whitecolor,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      textTheme: const TextTheme(

          headline1:TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(250, 204, 29, 1.0)
          ),
          headline2: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(250, 204, 29, 1.0)
          )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
         backgroundColor:backgroundcolor,
        unselectedIconTheme: IconThemeData(color: Colors.white,size: 30),
        selectedIconTheme: IconThemeData(color: Color.fromRGBO(250, 204, 29, 1.0),size: 30),
      )
  );
}