import 'github_user_model.dart';
import 'label_model.dart';
import 'milestone_model.dart';
import 'pull_request_model.dart';
import 'reactions_model.dart';

class IssueModel {
  String? url;
  String? repositoryUrl;
  String? labelsUrl;
  String? commentsUrl;
  String? eventsUrl;
  String? htmlUrl;
  int? id;
  String? nodeId;
  int? number;
  String? title;
  GithubUserModel? user;
  List<LabelModel>? labels;
  String? state;
  bool? locked;
  GithubUserModel? assignee;
  List<GithubUserModel>? assignees;
  MilestoneModel? milestone;
  int? comments;
  String? createdAt;
  String? updatedAt;
  String? authorAssociation;
  bool? draft;
  PullRequestModel? pullRequest;
  String? body;
  ReactionsModel? reactions;
  String? timelineUrl;
  double? score;

  IssueModel({
    this.url,
    this.repositoryUrl,
    this.labelsUrl,
    this.commentsUrl,
    this.eventsUrl,
    this.htmlUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.user,
    this.labels,
    this.state,
    this.locked,
    this.assignee,
    this.assignees,
    this.milestone,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.authorAssociation,
    this.draft,
    this.pullRequest,
    this.body,
    this.reactions,
    this.timelineUrl,
    this.score,
  });

  IssueModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    repositoryUrl = json['repository_url'];
    labelsUrl = json['labels_url'];
    commentsUrl = json['comments_url'];
    eventsUrl = json['events_url'];
    htmlUrl = json['html_url'];
    id = json['id'];
    nodeId = json['node_id'];
    number = json['number'];
    title = json['title'];
    user = json['user'] != null ? GithubUserModel.fromJson(json['user']) : null;
    if (json['labels'] != null) {
      labels = <LabelModel>[];
      json['labels'].forEach((v) {
        labels?.add(LabelModel.fromJson(v));
      });
    }
    state = json['state'];
    locked = json['locked'];
    assignee = json['assignee'] != null
        ? GithubUserModel.fromJson(json['assignee'])
        : null;
    if (json['assignees'] != null) {
      assignees = <GithubUserModel>[];
      json['assignees'].forEach((v) {
        assignees?.add(GithubUserModel.fromJson(v));
      });
    }
    milestone = json['milestone'] != null
        ? MilestoneModel.fromJson(json['milestone'])
        : null;
    comments = json['comments'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    authorAssociation = json['author_association'];
    draft = json['draft'];
    pullRequest = json['pull_request'] != null
        ? PullRequestModel.fromJson(json['pull_request'])
        : null;
    body = json['body'];
    reactions = json['reactions'] != null
        ? ReactionsModel.fromJson(json['reactions'])
        : null;
    timelineUrl = json['timeline_url'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['repository_url'] = repositoryUrl;
    data['labels_url'] = labelsUrl;
    data['comments_url'] = commentsUrl;
    data['events_url'] = eventsUrl;
    data['html_url'] = htmlUrl;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['number'] = number;
    data['title'] = title;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    if (labels != null) {
      data['labels'] = labels?.map((v) => v.toJson()).toList();
    }
    data['state'] = state;
    data['locked'] = locked;
    if (assignee != null) {
      data['assignee'] = assignee?.toJson();
    }
    if (assignees != null) {
      data['assignees'] = assignees?.map((v) => v.toJson()).toList();
    }
    if (milestone != null) {
      data['milestone'] = milestone?.toJson();
    }
    data['comments'] = comments;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['author_association'] = authorAssociation;
    data['draft'] = draft;
    if (pullRequest != null) {
      data['pull_request'] = pullRequest?.toJson();
    }
    data['body'] = body;
    if (reactions != null) {
      data['reactions'] = reactions?.toJson();
    }
    data['timeline_url'] = timelineUrl;
    data['score'] = score;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (other is IssueModel) {
      return id == other.id;
    }
    return super == other;
  }

  @override
  int get hashCode => super.hashCode;
}
