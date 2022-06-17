import 'dart:convert';

class ModelJadwalUasDosen {
  ModelJadwalUasDosen({
    required this.data,
  });

  final List<JadwalUas>? data;

  factory ModelJadwalUasDosen.fromJson(String str) => ModelJadwalUasDosen.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelJadwalUasDosen.fromMap(List json) => ModelJadwalUasDosen(
    data: json == null ? null : List<JadwalUas>.from(json.map((x) => JadwalUas.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class JadwalUas {
  JadwalUas({
    required this.idKelas,
    required this.mk,
    required this.hariUas,
    required this.jamUas,
    required this.ruangUas,
  });

  final dynamic idKelas;
  final String mk;
  final dynamic hariUas;
  final dynamic jamUas;
  final dynamic ruangUas;

  factory JadwalUas.fromJson(String str) => JadwalUas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JadwalUas.fromMap(Map<String, dynamic> json) => JadwalUas(
    idKelas: json["id_kelas"] == null ? null : json["id_kelas"],
    mk: json["mk"] == null ? null : json["mk"],
    hariUas: json["hari_uas"] == null ? null : json["hari_uas"],
    jamUas: json["jam_uas"] == null ? null : json["jam_uas"],
    ruangUas: json["ruang_uas"] == null ? null : json["ruang_uas"],
  );

  Map<String, dynamic> toMap() => {
    "id_kelas": idKelas == null ? null : idKelas,
    "mk": mk == null ? null : mk,
    "hari_uas": hariUas == null ? null : hariUas,
    "jam_uas": jamUas == null ? null : jamUas,
    "ruang_uas": ruangUas == null ? null : ruangUas,
  };
}
