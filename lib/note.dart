class Note {
  final int? id;
  final String text;
  final String createdAt;

  Note({this.id, required this.text, required this.createdAt});

 
  String get formattedDate {
    DateTime date = DateTime.parse(createdAt); 
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    String hour = date.hour.toString().padLeft(2, '0');
    String minute = date.minute.toString().padLeft(2, '0');
    String second = date.second.toString().padLeft(2, '0');

    return '$day.$month.$year, $hour:$minute:$second';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'created_at': createdAt,
    };
  }
}
