import 'package:flutter/material.dart';
import 'package:productive/assets/constants/colors.dart';

class AppTheme {
  static darkTheme() => ThemeData(
       textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: white,
          ),
          displayMedium: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: white,
          ),
          headlineMedium: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: white,
          ),
         
         
          labelSmall: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.blue,
          ),
          labelMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          labelLarge: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.blue,
          ),
          displaySmall: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          titleMedium: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          titleLarge: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          titleSmall: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.blue,
          ),
          bodyMedium:const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          bodySmall: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          headlineLarge:const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          minimumSize: const Size(double.infinity, 48),
          backgroundColor: textButtonColor,
        )),
        fontFamily: 'Barlow',
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        drawerTheme: const DrawerThemeData(
          backgroundColor: scaffoldBackgroundColor,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: appBarColor),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: scaffoldBackgroundColor,
          onPrimary: onPrimaryColor,
          secondary: secondaryColor,
          onSecondary: onPrimaryColor,
          error: errorColor,
          onError: onPrimaryColor,
          background: scaffoldBackgroundColor,
          onBackground: onPrimaryColor,
          surface: scaffoldBackgroundColor,
          onSurface: onPrimaryColor,
        ),
      );
}
