class Product {
  int? id;
  String? name;
  String? code;
  String? price;
  String? data;

  Product({
    this.id,
    required this.name,
    required this.code,
    required this.price,
    required this.data,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    price = json['price'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    //data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['price'] = price;
    data['data'] = this.data;
    return data;
  }

  Product copy({
    int? id,
    String? name,
    String? code,
    String? price,
    String? data,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        price: price ?? this.price,
        data: data ?? this.data,
      );
}
