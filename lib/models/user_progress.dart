class UserProgressModel {
  final int? id;
  final int? exerciceId;
  final String date;
  final String weight;
  final String repetition;

  UserProgressModel(
      {this.id,
      this.exerciceId,
      required this.date,
      required this.weight,
      required this.repetition});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "exercice_id": exerciceId,
      "date": date,
      "weight": weight,
      "repetition": repetition
    };
  }
}
