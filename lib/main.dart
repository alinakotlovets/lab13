import 'package:flutter/material.dart';
import 'note_screen.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Застосунок для збереження нотаток',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotesScreen(),
    );
  }
}