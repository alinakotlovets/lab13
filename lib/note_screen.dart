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
      _notes = notes.reversed.toList(); // Відображаємо останні нотатки першими
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
    _loadNotes(); // Перезавантажуємо список
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
        title: Text('Мої нотатки'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Нова нотатка',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addNote,
                  child: Text("Add"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6B558C), // Темно-фіолетова кнопка
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _notes[index].text,
                          style: Theme.of(context).textTheme.bodyLarge, // Основний текст
                        ),
                        SizedBox(height: 8),
                        Text(
                          _notes[index].formattedDate, // Форматована дата
                          style: Theme.of(context).textTheme.bodyMedium, // Текст для дати
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
