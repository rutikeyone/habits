class NoticeModel {
  int id;
  String body;
  String title;

  NoticeModel({required this.id, required this.title, required this.body});

  factory NoticeModel.fromMap(Map<String, dynamic> json) {
    return NoticeModel(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "body": body,
    };
  }
}
