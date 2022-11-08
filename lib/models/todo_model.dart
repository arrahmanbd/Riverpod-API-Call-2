
class TodoModel {
    int? userId;
    int? id;
    String? title;
    bool? completed;

    TodoModel({this.userId, this.id, this.title, this.completed});

    TodoModel.fromJson(Map<String, dynamic> json) {
        this.userId = json["userId"];
        this.id = json["id"];
        this.title = json["title"];
        this.completed = json["completed"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data["userId"] = this.userId;
        data["id"] = this.id;
        data["title"] = this.title;
        data["completed"] = this.completed;
        return data;
    }
}