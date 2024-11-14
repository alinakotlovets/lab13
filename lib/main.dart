import 'package:flutter/material.dart';
import './widgets/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab-12',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      home: const SignInScreen(),
    );
  }
}
