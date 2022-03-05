class HabitModel {
  int? id;
  String title;
  int colorValue;

  HabitModel({
    this.id,
    required this.title,
    required this.colorValue,
  });

  factory HabitModel.fromMap(Map<String, dynamic> json) => HabitModel(
        id: json['id'],
        title: json['title'],
        colorValue: json['color'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'color': colorValue,
    };
  }
}
