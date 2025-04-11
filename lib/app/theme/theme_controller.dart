// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moon_marketing_services/app/custom_widgets/custom_colors.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  Rx<ThemeMode> themeMode =
      ThemeMode.system.obs; // Default to system theme mode

  ThemeData get themeData => isDarkMode.value ? darkTheme : lightTheme;

  ThemeData lightTheme = ThemeData(
    iconTheme: const IconThemeData(
      color: AppColors.backgroundColor,
    ),
    // scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      // systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: Color.fromARGB(255, 2, 3, 82),
      //     statusBarBrightness: Brightness.light),
      // backgroundColor: Color.fromARGB(255, 2, 3, 82),
      backgroundColor: AppColors.primaryColor,
      //surfaceTintColor: Colors.white,
      foregroundColor: Colors.white,
      elevation: 4,
      //shadowColor: Colors.grey,
    ),
    useMaterial3: true,
    primaryColor:  AppColors.primaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
    ),
    // listTileTheme: const ListTileThemeData(
    //   tileColor: Colors.white,
    // ),
    expansionTileTheme: const ExpansionTileThemeData(
        iconColor: Colors.grey, textColor: Colors.black),
    // cardColor: const Color.fromARGB(255, 226, 223, 223),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[100],
      filled: true,
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
  // ThemeData(
  //   primarySwatch: Colors.blue,
  //   brightness: Brightness.light,
  //   // Define other light mode theme attributes here
  // );

  ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.blue,
      //primaryColor: Colors.white,
      brightness: Brightness.dark,
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Color.fromARGB(255, 44, 42, 42),
        filled: true,
        hintStyle: TextStyle(),
        suffixIconColor: Colors.white,
      ),
      primaryColor: const Color.fromARGB(255, 2, 3, 82),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        surfaceTintColor: AppColors.backgroundColor,
        elevation: 4,
        shadowColor: Colors.grey,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.backgroundColo0,
        contentTextStyle: TextStyle(color: Colors.white),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        textColor: Colors.white,
        iconColor: Colors.white,
      )
      // Define other dark mode theme attributes here
      );

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(themeData);
  }

  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(themeMode.value);
  }
  // var isDarkMode =false.obs;
  // void toggleTheme(){
  //   isDarkMode.value = !isDarkMode.value;
  // }
}
