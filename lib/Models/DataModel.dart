
class DataModel {
  DataModel({
    this.id,
    this.title,
    this.date,
  });

  int? id;
  String? title;
  String? date;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    id: json["id"],
    title: json["title"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "date": date,
  };
}
