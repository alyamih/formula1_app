class UserItem {
  String? name;

  UserItem({
    this.name,
  });

  factory UserItem.fromJson(Map<String, dynamic> parsedJson) {
    return UserItem(
      name: parsedJson['name'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
    };
  }
}
