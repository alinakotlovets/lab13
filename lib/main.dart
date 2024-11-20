import 'package:flutter/material.dart';
import 'note_screen.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Нотатки',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(212, 188, 255, 1.0),
        ),
        scaffoldBackgroundColor: Color(0xFFF1E6FF), // Світло-фіолетовий фон
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFD4BCFD), // Світло-фіолетовий колір для елементів
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white, // Білий фон для поля введення
          hintStyle: TextStyle(fontSize: 14, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)), // Округлені кути
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(103, 85, 140, 1.0),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5, // Додає тінь
          shadowColor: Colors.grey.withOpacity(0.3),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ),
      home: NotesScreen(),
    );
  }
}
