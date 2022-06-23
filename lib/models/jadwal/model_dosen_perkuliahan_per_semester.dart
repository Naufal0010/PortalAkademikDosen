import 'dart:convert';

class ModelJadwalPerkuliahanPerSemester {
  ModelJadwalPerkuliahanPerSemester({
    required this.data,
  });

  List<JadwalPerkuliahan>? data;

  factory ModelJadwalPerkuliahanPerSemester.fromJson(String str) => ModelJadwalPerkuliahanPerSemester.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelJadwalPerkuliahanPerSemester.fromMap(List json) => ModelJadwalPerkuliahanPerSemester(
    data: json == null ? null : List<JadwalPerkuliahan>.from(json.map((x) => JadwalPerkuliahan.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class JadwalPerkuliahan {
  JadwalPerkuliahan({
    required this.kodemk,
    required this.mk,
    required this.sks,
    required this.namaKelas,
    required this.namaProdi,
    required this.hari,
    required this.jam,
    required this.ruang,
  });

  final String kodemk;
  final String mk;
  final String sks;
  final String namaKelas;
  final String namaProdi;
  final String hari;
  final String jam;
  final String ruang;

  factory JadwalPerkuliahan.fromJson(String str) => JadwalPerkuliahan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JadwalPerkuliahan.fromMap(Map<String, dynamic> json) => JadwalPerkuliahan(
    kodemk: json["kodemk"] == null ? null : json["kodemk"],
    mk: json["mk"] == null ? null : json["mk"],
    sks: json["sks"] == null ? null : json["sks"],
    namaKelas: json["nama_kelas"] == null ? null : json["nama_kelas"],
    namaProdi: json["nama_prodi"] == null ? null : json["nama_prodi"],
    hari: json["hari"] == null ? null : json["hari"],
    jam: json["jam"] == null ? null : json["jam"],
    ruang: json["ruang"] == null ? null : json["ruang"],
  );

  Map<String, dynamic> toMap() => {
    "kodemk": kodemk == null ? null : kodemk,
    "mk": mk == null ? null : mk,
    "sks": sks == null ? null : sks,
    "nama_kelas": namaKelas == null ? null : namaKelas,
    "nama_prodi": namaProdi == null ? null : namaProdi,
    "hari": hari == null ? null : hari,
    "jam": jam == null ? null : jam,
    "ruang": ruang == null ? null : ruang,
  };
}
