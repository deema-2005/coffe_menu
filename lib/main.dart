import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'menu_screen.dart';

void main() {
  runApp(const CoffeeMenuApp());
}

class CoffeeMenuApp extends StatelessWidget {
  const CoffeeMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Menu',

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDFBF9),
        primaryColor: const Color(0xFF6F4E37),


        cardColor: const Color(0xFFF1EAE4),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6F4E37),
          surface: const Color(0xFFFFFFFF),
          secondary: const Color(0xFFD9A066),
        ),


        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(color: Color(0xFF2B2118)),  // Text — primary
            bodyMedium: const TextStyle(color: Color(0xFF6F6156)), // Text — secondary
          ),
        ),
      ),

      home: const MenuScreen(),
    );
  }
}


