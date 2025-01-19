import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
   MyApp()
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        // textTheme: Theme.of(context).textTheme.apply(
        //   bodyColor: Colors.white,
        //   displayColor: Colors.white
        // ),
        fontFamily: GoogleFonts.poppins().fontFamily
      ),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}