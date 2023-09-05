class UserDataModel {
  String? name;
  String? sureName;
  String? gender;
  String? age;
  String? id;

  UserDataModel({this.name, this.sureName, this.gender, this.age, this.id});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sureName = json['sure_name'];
    gender = json['gender'];
    age = json['age'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['sure_name'] = sureName;
    data['gender'] = gender;
    data['age'] = age;
    data['id'] = id;
    return data;
  }
}
