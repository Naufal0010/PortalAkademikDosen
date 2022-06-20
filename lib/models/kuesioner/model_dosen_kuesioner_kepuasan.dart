import 'dart:convert';

class ModelDosenKuesionerKepuasan {
  ModelDosenKuesionerKepuasan({
    required this.dosenId,
    required this.kuisioner,
  });

  final String dosenId;
  final List<DataKuesioner>? kuisioner;

  factory ModelDosenKuesionerKepuasan.fromJson(String str) => ModelDosenKuesionerKepuasan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelDosenKuesionerKepuasan.fromMap(Map<String, dynamic> json) => ModelDosenKuesionerKepuasan(
    dosenId: json["dosenId"] == null ? null : json["dosenId"],
    kuisioner: json["kuisioner"] == null ? null : List<DataKuesioner>.from(json["kuisioner"].map((x) => DataKuesioner.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "dosenId": dosenId == null ? null : dosenId,
    "kuisioner": kuisioner == null ? null : List<dynamic>.from(kuisioner!.map((x) => x.toMap())),
  };
}

class DataKuesioner {
  DataKuesioner({
    required this.idSoal,
    required this.soal,
    required this.status,
    required this.jenis,
    required this.createdAt,
    required this.updatedAt,
  });

  final String idSoal;
  final String soal;
  final String status;
  final String jenis;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory DataKuesioner.fromJson(String str) => DataKuesioner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataKuesioner.fromMap(Map<String, dynamic> json) => DataKuesioner(
    idSoal: json["id_soal"] == null ? null : json["id_soal"],
    soal: json["soal"] == null ? null : json["soal"],
    status: json["status"] == null ? null : json["status"],
    jenis: json["jenis"] == null ? null : json["jenis"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "id_soal": idSoal == null ? null : idSoal,
    "soal": soal == null ? null : soal,
    "status": status == null ? null : status,
    "jenis": jenis == null ? null : jenis,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}