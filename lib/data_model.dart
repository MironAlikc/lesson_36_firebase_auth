class DataModel {
  String? data;
  String? image;
  String? id;

  DataModel({this.data, this.image});

  DataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['image'] = image;
    data['id'] = id;
    return data;
  }
}
