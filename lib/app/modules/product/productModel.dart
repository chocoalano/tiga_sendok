class ProductModel {
  int id;
  String uuid;
  String code;
  String name;
  int price;
  Unit unit;

  ProductModel({
    required this.id,
    required this.uuid,
    required this.code,
    required this.name,
    required this.price,
    required this.unit,
  });

  ProductModel copyWith({
    int? id,
    String? uuid,
    String? code,
    String? name,
    int? price,
    Unit? unit,
  }) =>
      ProductModel(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        code: code ?? this.code,
        name: name ?? this.name,
        price: price ?? this.price,
        unit: unit ?? this.unit,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
