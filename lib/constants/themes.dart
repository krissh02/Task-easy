import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: Colors.white,
        onPrimary: Colors.black,
        //  onPrimary: Color.fromRGBO(45, 115, 255, 1),
        secondary: Color.fromRGBO(45, 115, 255, 1),
        onSecondary: Colors.white,
      ),
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: Colors.white,
        onPrimary: Colors.black,
        // onPrimary: Color.fromARGB(255, 49, 189, 197),
        secondary: Color.fromARGB(255, 49, 189, 197),
        onSecondary: Colors.white,
      ),
);
