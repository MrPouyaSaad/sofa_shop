import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sofa_shop/common/const.dart';
import 'package:sofa_shop/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sofa Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: primaryColor,
        hintColor: primaryColor,
        useMaterial3: true,
      ),
      home: const ProductScreen(),
    );
  }
}
