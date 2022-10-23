import 'package:segs/models/projects.dart';

class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? introText;
  String? description;
  String? imgUrl;
  String? email;
  String? twitterUrl;
  String? instagramUrl;
  String? gitHubUrl;
  String? linkedInUrl;
  String? status;
  String? activeTemplate;
  List<Project>? projects;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.introText,
      this.description,
      this.imgUrl,
      this.email,
      this.twitterUrl,
      this.instagramUrl,
      this.gitHubUrl,
      this.linkedInUrl,
      this.status,
      this.activeTemplate,
      this.projects});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    introText = json['introText'];
    description = json['description'];
    imgUrl = json['imgUrl'];
    email = json['email'];
    twitterUrl = json['twitterUrl'];
    instagramUrl = json['instagramUrl'];
    gitHubUrl = json['gitHubUrl'];
    linkedInUrl = json['linkedInUrl'];
    status = json['status'];
    activeTemplate = json['activeTemplate'];
    if (json['projects'] != null) {
      projects = <Project>[];
      json['projects'].forEach((v) {
        projects!.add(Project.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['introText'] = introText;
    data['description'] = description;
    data['imgUrl'] = imgUrl;
    data['email'] = email;
    data['twitterUrl'] = twitterUrl;
    data['instagramUrl'] = instagramUrl;
    data['gitHubUrl'] = gitHubUrl;
    data['linkedInUrl'] = linkedInUrl;
    data['status'] = status;
    data['activeTemplate'] = activeTemplate;
    if (projects != null) {
      data['projects'] = projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
