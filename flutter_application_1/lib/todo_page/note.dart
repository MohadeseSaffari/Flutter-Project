class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      modifiedTime: DateTime.parse(json['modified_time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'modified_time': modifiedTime.toIso8601String(),
    };
  }

  Note copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? modifiedTime,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      modifiedTime: modifiedTime ?? this.modifiedTime,
    );
  }
}
