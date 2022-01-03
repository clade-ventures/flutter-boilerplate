class LabelModel {
  int? id;
  String? nodeId;
  String? url;
  String? name;
  String? color;
  bool? defaul;
  String? description;

  LabelModel({
    this.id,
    this.nodeId,
    this.url,
    this.name,
    this.color,
    this.defaul,
    this.description,
  });

  LabelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    url = json['url'];
    name = json['name'];
    color = json['color'];
    defaul = json['default'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['node_id'] = nodeId;
    data['url'] = url;
    data['name'] = name;
    data['color'] = color;
    data['default'] = defaul;
    data['description'] = description;
    return data;
  }
}
