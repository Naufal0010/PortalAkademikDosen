import 'dart:convert';

var now = DateTime.now();

class ModelDosenSemesterAktif {
  ModelDosenSemesterAktif({
    required this.semesterAktif,
  });

  final SemesterAktif? semesterAktif;

  factory ModelDosenSemesterAktif.fromJson(String str) => ModelDosenSemesterAktif.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelDosenSemesterAktif.fromMap(Map<String, dynamic> json) => ModelDosenSemesterAktif(
    semesterAktif: json["semesterAktif"] == null ? null : SemesterAktif.fromMap(json["semesterAktif"]),
  );

  Map<String, dynamic> toMap() => {
    "semesterAktif": semesterAktif == null ? null : semesterAktif!.toMap(),
  };
}

class SemesterAktif {
  SemesterAktif({
    required this.kode,
    required this.tahun,
    required this.kodeNamaSemester,
    required this.tanggalMulai,
    required this.tanggalSelesai,
  });

  final String kode;
  final String tahun;
  final String kodeNamaSemester;
  final DateTime? tanggalMulai;
  final DateTime? tanggalSelesai;

  factory SemesterAktif.fromJson(String str) => SemesterAktif.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SemesterAktif.fromMap(Map<String, dynamic> json) => SemesterAktif(
    kode: json["kode"] == null ? null : json["kode"],
    tahun: json["tahun"] == null ? null : json["tahun"],
    kodeNamaSemester: json["kodeNamaSemester"] == null ? null : json["kodeNamaSemester"],
    tanggalMulai: json["tanggalMulai"] == null ? null : DateTime.parse(json["tanggalMulai"]),
    tanggalSelesai: json["tanggalSelesai"] == null ? null : DateTime.parse(json["tanggalSelesai"]),
  );

  Map<String, dynamic> toMap() => {
    "kode": kode == null ? null : kode,
    "tahun": tahun == null ? null : tahun,
    "kodeNamaSemester": kodeNamaSemester == null ? null : kodeNamaSemester,
    "tanggalMulai": tanggalMulai == null ? null : "${tanggalMulai!.year.toString().padLeft(4, '0')}-${tanggalMulai!.month.toString().padLeft(2, '0')}-${tanggalMulai!.day.toString().padLeft(2, '0')}",
    "tanggalSelesai": tanggalSelesai == null ? null : "${tanggalSelesai!.year.toString().padLeft(4, '0')}-${tanggalSelesai!.month.toString().padLeft(2, '0')}-${tanggalSelesai!.day.toString().padLeft(2, '0')}",
  };
}
