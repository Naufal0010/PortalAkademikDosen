import 'dart:convert';

class ModelDosenJadwalPenting {
  ModelDosenJadwalPenting({
    required this.data,
  });

  final List<JadwalPenting>? data;

  factory ModelDosenJadwalPenting.fromJson(String str) =>
      ModelDosenJadwalPenting.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelDosenJadwalPenting.fromMap(List json) =>
      ModelDosenJadwalPenting(
        data: json == null
            ? null
            : List<JadwalPenting>.from(json.map((x) => JadwalPenting.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class JadwalPenting {
  JadwalPenting({
    required this.jadwal,
    required this.semester,
    required this.mulai,
    required this.selesai,
    required this.tglMulai,
    required this.jamMulai,
    required this.tglSelesai,
    required this.jamSelesai,
  });

  final String jadwal;
  final String semester;
  final String mulai;
  final String selesai;
  final String tglMulai;
  final String jamMulai;
  final String tglSelesai;
  final String jamSelesai;

  factory JadwalPenting.fromJson(String str) => JadwalPenting.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JadwalPenting.fromMap(Map<String, dynamic> json) => JadwalPenting(
        jadwal: json["jadwal"] == null ? null : json["jadwal"],
        semester: json["semester"] == null ? null : json["semester"],
        mulai: json["mulai"] == null ? null : json["mulai"],
        selesai: json["selesai"] == null ? null : json["selesai"],
        tglMulai: json["tgl_mulai"] == null ? null : json["tgl_mulai"],
        jamMulai: json["jam_mulai"] == null ? null : json["jam_mulai"],
        tglSelesai: json["tgl_selesai"] == null ? null : json["tgl_selesai"],
        jamSelesai: json["jam_selesai"] == null ? null : json["jam_selesai"],
      );

  Map<String, dynamic> toMap() => {
        "jadwal": jadwal == null ? null : jadwal,
        "semester": semester == null ? null : semester,
        "mulai": mulai == null ? null : mulai,
        "selesai": selesai == null ? null : selesai,
        "tgl_mulai": tglMulai == null ? null : tglMulai,
        "jam_mulai": jamMulai == null ? null : jamMulai,
        "tgl_selesai": tglSelesai == null ? null : tglSelesai,
        "jam_selesai": jamSelesai == null ? null : jamSelesai,
      };
}
