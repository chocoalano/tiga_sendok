class ProductUnitId {
  int id;
  String uuid;
  String name;

  ProductUnitId({
    required this.id,
    required this.uuid,
    required this.name,
  });

  ProductUnitId copyWith({
    int? id,
    String? uuid,
    String? name,
  }) =>
      ProductUnitId(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
      );

  factory ProductUnitId.fromJson(Map<String, dynamic> json) => ProductUnitId(
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
