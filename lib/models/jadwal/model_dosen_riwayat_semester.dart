import 'dart:convert';

class ModelRiwayatSemesterDosen {
  ModelRiwayatSemesterDosen({
    required this.data,
  });

  final List<RiwayatSemester>? data;

  factory ModelRiwayatSemesterDosen.fromJson(String str) => ModelRiwayatSemesterDosen.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelRiwayatSemesterDosen.fromMap(List json) => ModelRiwayatSemesterDosen(
    data: json == null ? null : List<RiwayatSemester>.from(json.map((x) => RiwayatSemester.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class RiwayatSemester {
  RiwayatSemester({
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

  factory RiwayatSemester.fromJson(String str) => RiwayatSemester.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RiwayatSemester.fromMap(Map<String, dynamic> json) => RiwayatSemester(
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
