import 'dart:convert';

class ModelDosenSemesterAmpu {
  ModelDosenSemesterAmpu({
    required this.data,
  });

  final List<SemesterAmpu>? data;

  factory ModelDosenSemesterAmpu.fromJson(String str) => ModelDosenSemesterAmpu.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelDosenSemesterAmpu.fromMap(List json) => ModelDosenSemesterAmpu(
    data: json == null ? null : List<SemesterAmpu>.from(json.map((x) => SemesterAmpu.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class SemesterAmpu {
  SemesterAmpu({
    required this.semId,
    required this.semTahun,
    required this.kode,
    required this.semNama,
    required this.semAktif,
  });

  final String semId;
  final String semTahun;
  final String kode;
  final String semNama;
  final dynamic semAktif;

  factory SemesterAmpu.fromJson(String str) => SemesterAmpu.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SemesterAmpu.fromMap(Map<String, dynamic> json) => SemesterAmpu(
    semId: json["semId"] == null ? null : json["semId"],
    semTahun: json["semTahun"] == null ? null : json["semTahun"],
    kode: json["kode"] == null ? null : json["kode"],
    semNama: json["semNama"] == null ? null : json["semNama"],
    semAktif: json["semAktif"] == null ? null : json["semAktif"],
  );

  Map<String, dynamic> toMap() => {
    "semId": semId == null ? null : semId,
    "semTahun": semTahun == null ? null : semTahun,
    "kode": kode == null ? null : kode,
    "semNama": semNama == null ? null : semNama,
    "semAktif": semAktif == null ? null : semAktif,
  };
}
