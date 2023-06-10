import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talim_e_kavaif/views/resume/resume_home/resume_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talim e Kavaif',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff00144F), 
          primary: const Color(0xff00144F),
          secondary: const Color(0xff396eb0),
          tertiary: const Color(0xffFFC100),
          surface: Colors.white,
          background:const Color(0xffF1F5F9),
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const ResumeCardHome(),
    );
  }
}
