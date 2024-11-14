class Note {
  final int? id;
  final String text;
  final String createdAt;

  Note({this.id, required this.text, required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'created_at': createdAt,
    };
  }
}