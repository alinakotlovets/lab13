import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'note.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final TextEditingController _controller = TextEditingController();
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await _databaseHelper.getNotes();
    setState(() {
      _notes = notes;
    });
  }

  Future<void> _addNote() async {
    String noteText = _controller.text.trim();
    if (noteText.isEmpty) {
      _showErrorDialog("Нотатка не може бути пустою.");
      return;
    }

    final newNote = Note(
      text: noteText,
      createdAt: DateTime.now().toString(),
    );

    await _databaseHelper.insertNote(newNote);
    _controller.clear();
    _loadNotes();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Помилка"),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("ОК"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Застосунок для збереження нотаток'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Введіть нотатку',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addNote,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_notes[index].text),
                  subtitle: Text(_notes[index].createdAt),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}