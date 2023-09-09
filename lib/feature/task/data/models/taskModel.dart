class TaskModel {
  final int? id;
  final String title;
  final String note;
  final String date;
  final String startTime;
  final String endTime;
  final int isCombleted;
  int? color;
  TaskModel(
      {required this.title,
      required this.startTime,
      required this.endTime,
      required this.note,
      required this.color,
      required this.date,
      required this.isCombleted,
      this.id});

  //static getcolor(int? color) {}
  factory TaskModel.fromJson(Map<String, dynamic> jsonData) {
    return TaskModel(
      id:jsonData['id'],
      title: jsonData['title'],
      startTime: jsonData['startTime'],
      endTime: jsonData['endTime'],
      note: jsonData['note'],
      color: jsonData['color'],
      date: jsonData['date'],
      isCombleted: jsonData['isCombleted'],
    );
  }
}
