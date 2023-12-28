class Constructor {
  String constructorId = "";
  String name = "";
  String nationality = "";
  bool isFavorite = false;

  Constructor.empty();

  Constructor.fromJson(obj) {
    constructorId = obj["constructorId"];
    name = obj["name"];
    nationality = obj["nationality"];
    nationality = obj["nationality"];
  }
  Map<String, dynamic> toJson() {
    return {
      "constructorId": constructorId,
      "name": name,
      "nationality": nationality,
    };
  }

  Constructor(this.constructorId, this.name, this.nationality);
}
