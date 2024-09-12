class User {
  int? id;
  String? fullName;
  String? userName;
  String? password;

  User(
      {this.id,
      required this.fullName,
      required this.userName,
      required this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    userName = json['user_name'];
    password = json['password'];
  }

// Suggested code may be subject to a license. Learn more: ~LicenseLog:1140358016.
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    //data['id'] = id;
    data['full_name'] = fullName;
    data['user_name'] = userName;
    data['password'] = password;
    return data;
  }

  User copy({int? id, String? fullname, String? username, String? password}) =>
      User(
          id: id ?? this.id,
          fullName: fullname ?? this.fullName,
          userName: username ?? this.userName,
          password: password ?? this.password);
}
