class Note {
  int? id;
  late String title;
  late String description;
  late String date;

  Note(this.title, this.description, this.date);

  Note.fromMap(Map map) {
    id = map["id"];
    title = map["title"];
    description = map["description"];
    date = map["date"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "title": title,
      "description": description,
      "date": date,
    };

    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'Note: {id: $id, title: $title, description: $description, date: $date}';
  }
}
