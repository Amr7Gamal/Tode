class TaskData {
  static const String nameKey = "task";

  String? title, description, id;

  DateTime? dateTime;
  bool? isDone;

  TaskData({this.title, this.description, this.id, this.dateTime, this.isDone});

  TaskData.fromFirestore(Map<String, dynamic> date)
      : this(
            title: date["title"],
            description: date["descripion"],
            id: date["id"],
            dateTime: DateTime.fromMillisecondsSinceEpoch(date["dateTime"]),
            isDone: date["isDone"]);

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "descripion": description,
      "id": id,
      "dateTime": dateTime?.millisecondsSinceEpoch,
      "isDone": isDone
    };
  }
}
