class Notes {
  String? title;
  String? text;

  Notes({
    this.title,
    this.text,
  });

  factory Notes.fromJson(Map<String, dynamic> parsedJson) {
    return Notes(
      title: parsedJson['title'] ?? "",
      text: parsedJson['text'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "text": text,
    };
  }
}
