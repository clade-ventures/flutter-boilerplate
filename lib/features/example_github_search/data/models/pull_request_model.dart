class PullRequestModel {
  String? url;
  String? htmlUrl;
  String? diffUrl;
  String? patchUrl;

  PullRequestModel({
    this.url,
    this.htmlUrl,
    this.diffUrl,
    this.patchUrl,
  });

  PullRequestModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    htmlUrl = json['html_url'];
    diffUrl = json['diff_url'];
    patchUrl = json['patch_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['diff_url'] = diffUrl;
    data['patch_url'] = patchUrl;
    return data;
  }
}
