class StoreModel {
  String? name;
  String? cnpj;
  String? address;

  StoreModel({required this.name, required this.cnpj, required this.address});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cnpj': cnpj,
      'address': address,
    };
  }

  static StoreModel fromJson(Map<String, dynamic> json) {
    return StoreModel(
        name: json['name'], cnpj: json['cnpj'], address: json['address']);
  }
}
