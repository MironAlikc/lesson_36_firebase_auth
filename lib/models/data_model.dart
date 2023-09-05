class DataModel {
  String? data;
  String? image;
  String? id;

  DataModel({this.data, this.image, this.id});

  DataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['image'] = image;
    data['id'] = id;
    return data;
  }
}
