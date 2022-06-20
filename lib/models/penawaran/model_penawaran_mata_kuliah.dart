import 'dart:convert';

class ModelPenawaranMataKuliah {
  ModelPenawaranMataKuliah({
    required this.data,
  });

  final Map<String, String>? data;

  factory ModelPenawaranMataKuliah.fromJson(String str) =>
      ModelPenawaranMataKuliah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelPenawaranMataKuliah.fromMap(Map<String, dynamic> json) =>
      ModelPenawaranMataKuliah(
        data: json == null
            ? null
            : Map.from(json)
                .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
