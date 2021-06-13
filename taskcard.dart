class TaskCard {
  final String task_name;
  final String task_detail;

  TaskCard({this.task_name, this.task_detail});

  factory TaskCard.fromJson(dynamic json) {
    return TaskCard(
      task_name: json['task_name'] as String,
      task_detail: json['task_detail'] as String,
    );
  }
}
