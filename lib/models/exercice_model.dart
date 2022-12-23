class ExerciceModel {
  final int? id;
  final int categorieId;
  final String name;

  ExerciceModel({this.id, required this.categorieId, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "categorie_id": categorieId,
      "name": name,
    };
  }
}
