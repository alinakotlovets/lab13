import 'package:flutter/material.dart';
import 'modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Preview App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(92, 73, 134, 1),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle:
              TextStyle(fontSize: 14, color: Color.fromRGBO(92, 73, 134, 1)),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(92, 73, 134, 1), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(92, 73, 134, 1), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(92, 73, 134, 1),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Color.fromRGBO(0, 0, 0, 1.0),
            ),
            foregroundColor: const Color.fromRGBO(92, 73, 134, 1),
            textStyle: const TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        sliderTheme: const SliderThemeData(
          activeTrackColor: Color.fromRGBO(92, 73, 134, 1),
          thumbColor: Color.fromRGBO(92, 73, 134, 1),
          valueIndicatorColor: Color.fromRGBO(92, 73, 134, 1),
        ),
      ),
      home: const FirstScreen(),
    );
  }
}
