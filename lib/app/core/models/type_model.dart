import 'type_fields.dart';

class TypeModel {
  int? id;
  String? name;
  String? createdAt;
  String? createdBy;

  TypeModel({this.id, this.name, this.createdAt, this.createdBy});

  TypeModel.fromJson(Map<String, dynamic> json) {
    id = json[TypeFields.id];
    name = json[TypeFields.name];
    createdAt = json[TypeFields.createdAt];
    createdBy = json[TypeFields.createdBy];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data[TypeFields.name] = name;
    data[TypeFields.createdAt] = createdAt;
    data[TypeFields.createdBy] = createdBy;

    return data;
  }
}
