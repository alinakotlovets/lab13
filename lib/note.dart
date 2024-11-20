class Note {
  final int? id;
  final String text;
  final String createdAt;

  Note({this.id, required this.text, required this.createdAt});

  /// Форматуємо дату у вигляді 'день.місяць.рік, година:хвилина:секунда'
  String get formattedDate {
    DateTime date = DateTime.parse(createdAt); // Парсимо рядок у DateTime
    String day = date.day.toString().padLeft(2, '0'); // Додаємо 0, якщо день < 10
    String month = date.month.toString().padLeft(2, '0'); // Додаємо 0, якщо місяць < 10
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
