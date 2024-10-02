class UserModel {
  int? id;
  String? fullName;
  String? userName;
  String? identifier;
  bool? storecnpj;
  String? permission;

  UserModel(
      {this.id,
      required this.fullName,
      required this.userName,
      required this.identifier,
      this.storecnpj,
      this.permission});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullname'];
    userName = json['username'];
    identifier = json['identifier'];
    permission = json['permission'];
    storecnpj = json['cnpj'];
  }

// Suggested code may be subject to a license. Learn more: ~LicenseLog:1140358016.
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    //data['id'] = id;
    data['fullname'] = fullName;
    data['username'] = userName;
    data['identifier'] = identifier;
    data['cnpj'] = storecnpj;
    data['permission'] = permission;
    return data;
  }

  UserModel copy(
          {int? id,
          String? fullname,
          String? username,
          String? identifier,
          String? permission,
          bool? haveStore}) =>
      UserModel(
          id: id ?? this.id,
          fullName: fullname ?? fullName,
          userName: username ?? userName,
          identifier: identifier ?? identifier,
          storecnpj: storecnpj,
          permission: permission);
}
