import 'github_user_model.dart';

class MilestoneModel {
  String? url;
  String? htmlUrl;
  String? labelsUrl;
  int? id;
  String? nodeId;
  int? number;
  String? title;
  String? description;
  GithubUserModel? creator;
  int? openIssues;
  int? closedIssues;
  String? state;
  String? createdAt;
  String? updatedAt;

  MilestoneModel({
    this.url,
    this.htmlUrl,
    this.labelsUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.description,
    this.creator,
    this.openIssues,
    this.closedIssues,
    this.state,
    this.createdAt,
    this.updatedAt,
  });

  MilestoneModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    htmlUrl = json['html_url'];
    labelsUrl = json['labels_url'];
    id = json['id'];
    nodeId = json['node_id'];
    number = json['number'];
    title = json['title'];
    description = json['description'];
    creator = json['creator'] != null
        ? GithubUserModel?.fromJson(json['creator'])
        : null;
    openIssues = json['open_issues'];
    closedIssues = json['closed_issues'];
    state = json['state'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['labels_url'] = labelsUrl;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['number'] = number;
    data['title'] = title;
    data['description'] = description;
    if (creator != null) {
      data['creator'] = creator?.toJson();
    }
    data['open_issues'] = openIssues;
    data['closed_issues'] = closedIssues;
    data['state'] = state;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
