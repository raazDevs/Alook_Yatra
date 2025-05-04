class TaskModel {
  String? title;
  String? description;
  String? priority;
  String? deadline;

  TaskModel({this.title, this.description, this.priority, this.deadline});

  TaskModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    priority = json['priority'];
    deadline = json['deadline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['priority'] = this.priority;
    data['deadline'] = this.deadline;
    return data;
  }
}
