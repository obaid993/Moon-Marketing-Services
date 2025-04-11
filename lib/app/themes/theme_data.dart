import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  primaryColor: const Color.fromARGB(255, 2, 3, 82),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(color: Colors.black38),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
