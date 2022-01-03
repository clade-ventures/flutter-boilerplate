class LicenseModel {
  String? key;
  String? name;
  String? spdxId;
  String? url;
  String? nodeId;

  LicenseModel({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  LicenseModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    spdxId = json['spdx_id'];
    url = json['url'];
    nodeId = json['node_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['spdx_id'] = spdxId;
    data['url'] = url;
    data['node_id'] = nodeId;
    return data;
  }
}
