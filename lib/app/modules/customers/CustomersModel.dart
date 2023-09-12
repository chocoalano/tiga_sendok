class CustomersModel {
  int id;
  String uuid;
  String name;
  Gender gender;
  String phone;

  CustomersModel({
    required this.id,
    required this.uuid,
    required this.name,
    required this.gender,
    required this.phone,
  });

  CustomersModel copyWith({
    int? id,
    String? uuid,
    String? name,
    Gender? gender,
    String? phone,
  }) =>
      CustomersModel(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        phone: phone ?? this.phone,
      );

  factory CustomersModel.fromJson(Map<String, dynamic> json) => CustomersModel(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        gender: genderValues.map[json["gender"]]!,
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "gender": genderValues.reverse[gender],
        "phone": phone,
      };
}

enum Gender { FEMALE, MALE, OTHER }

final genderValues = EnumValues(
    {"female": Gender.FEMALE, "male": Gender.MALE, "other": Gender.OTHER});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
