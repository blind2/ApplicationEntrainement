class CategorieModel {
  final int? id;
  final int categorieId;
  final String name;

  CategorieModel({this.id, required this.categorieId, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "categorie_id": categorieId,
      "name": name,
    };
  }
}
