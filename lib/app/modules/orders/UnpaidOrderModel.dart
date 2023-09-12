class UnpaidOrderModel {
  int id;
  int qty;
  int price;
  int total;
  int isPaid;
  DateTime createdAt;
  Customer customer;
  Product product;

  UnpaidOrderModel({
    required this.id,
    required this.qty,
    required this.price,
    required this.total,
    required this.isPaid,
    required this.createdAt,
    required this.customer,
    required this.product,
  });

  UnpaidOrderModel copyWith({
    int? id,
    int? qty,
    int? price,
    int? total,
    int? isPaid,
    DateTime? createdAt,
    Customer? customer,
    Product? product,
  }) =>
      UnpaidOrderModel(
        id: id ?? this.id,
        qty: qty ?? this.qty,
        price: price ?? this.price,
        total: total ?? this.total,
        isPaid: isPaid ?? this.isPaid,
        createdAt: createdAt ?? this.createdAt,
        customer: customer ?? this.customer,
        product: product ?? this.product,
      );

  factory UnpaidOrderModel.fromJson(Map<String, dynamic> json) =>
      UnpaidOrderModel(
        id: json["id"],
        qty: json["qty"],
        price: json["price"],
        total: json["total"],
        isPaid: json["is_paid"],
        createdAt: DateTime.parse(json["created_at"]),
        customer: Customer.fromJson(json["customer"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "qty": qty,
        "price": price,
        "total": total,
        "is_paid": isPaid,
        "created_at": createdAt.toIso8601String(),
        "customer": customer.toJson(),
        "product": product.toJson(),
      };
}

class Customer {
  int id;
  String uuid;
  String name;
  String gender;
  String phone;

  Customer({
    required this.id,
    required this.uuid,
    required this.name,
    required this.gender,
    required this.phone,
  });

  Customer copyWith({
    int? id,
    String? uuid,
    String? name,
    String? gender,
    String? phone,
  }) =>
      Customer(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        phone: phone ?? this.phone,
      );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        gender: json["gender"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "gender": gender,
        "phone": phone,
      };
}

class Product {
  int id;
  String uuid;
  String code;
  String name;
  int price;
  Unit unit;

  Product({
    required this.id,
    required this.uuid,
    required this.code,
    required this.name,
    required this.price,
    required this.unit,
  });

  Product copyWith({
    int? id,
    String? uuid,
    String? code,
    String? name,
    int? price,
    Unit? unit,
  }) =>
      Product(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        code: code ?? this.code,
        name: name ?? this.name,
        price: price ?? this.price,
        unit: unit ?? this.unit,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        uuid: json["uuid"],
        code: json["code"],
        name: json["name"],
        price: json["price"],
        unit: Unit.fromJson(json["unit"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "code": code,
        "name": name,
        "price": price,
        "unit": unit.toJson(),
      };
}

class Unit {
  int id;
  String uuid;
  String name;

  Unit({
    required this.id,
    required this.uuid,
    required this.name,
  });

  Unit copyWith({
    int? id,
    String? uuid,
    String? name,
  }) =>
      Unit(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
      );

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
      };
}
