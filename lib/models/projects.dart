class Project {
  String? id;
  String? title;
  String? description;
  String? status;
  String? stack;
  String? imgUrl;
  String? appUrl;
  String? webUrl;
  String? type;

  Project(
      {this.id,
      this.title,
      this.description,
      this.status,
      this.stack,
      this.imgUrl,
      this.appUrl,
      this.webUrl,
      this.type});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    stack = json['stack'];
    imgUrl = json['imgUrl'];
    appUrl = json['appUrl'];
    webUrl = json['webUrl'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['status'] = status;
    data['stack'] = stack;
    data['imgUrl'] = imgUrl;
    data['appUrl'] = appUrl;
    data['webUrl'] = webUrl;
    data['type'] = type;
    return data;
  }
}
