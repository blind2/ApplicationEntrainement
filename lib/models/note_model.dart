class NoteModel {
  final int? id;
  final String date;
  final String title;
  final String description;

  NoteModel(
      {this.id,
      required this.date,
      required this.title,
      required this.description});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "date": date,
      "title": title,
      "description": description,
    };
  }
}
