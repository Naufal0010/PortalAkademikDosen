import 'dart:convert';

class ModelDosenSemesterAktif {
  ModelDosenSemesterAktif({
    required this.semesterAktif,
    required this.eventMahasiswa,
    required this.eventDosen,
  });

  final SemesterAktif? semesterAktif;
  final List<Event>? eventMahasiswa;
  final List<Event>? eventDosen;

  factory ModelDosenSemesterAktif.fromJson(String str) => ModelDosenSemesterAktif.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelDosenSemesterAktif.fromMap(Map<String, dynamic> json) => ModelDosenSemesterAktif(
    semesterAktif: json["semesterAktif"] == null ? null : SemesterAktif.fromMap(json["semesterAktif"]),
    eventMahasiswa: json["eventMahasiswa"] == null ? null : List<Event>.from(json["eventMahasiswa"].map((x) => Event.fromMap(x))),
    eventDosen: json["eventDosen"] == null ? null : List<Event>.from(json["eventDosen"].map((x) => Event.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "semesterAktif": semesterAktif == null ? null : semesterAktif!.toMap(),
    "eventMahasiswa": eventMahasiswa == null ? null : List<dynamic>.from(eventMahasiswa!.map((x) => x.toMap())),
    "eventDosen": eventDosen == null ? null : List<dynamic>.from(eventDosen!.map((x) => x.toMap())),
  };
}

class Event {
  Event({
    required this.id,
    required this.event,
    required this.mulai,
    required this.selesai,
    required this.keterangan,
  });

  final String id;
  final String event;
  final DateTime? mulai;
  final DateTime? selesai;
  final String keterangan;

  factory Event.fromJson(String str) => Event.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Event.fromMap(Map<String, dynamic> json) => Event(
    id: json["id"] == null ? null : json["id"],
    event: json["event"] == null ? null : json["event"],
    mulai: json["mulai"] == null ? null : DateTime.parse(json["mulai"]),
    selesai: json["selesai"] == null ? null : DateTime.parse(json["selesai"]),
    keterangan: json["keterangan"] == null ? null : json["keterangan"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "event": event == null ? null : event,
    "mulai": mulai == null ? null : mulai!.toIso8601String(),
    "selesai": selesai == null ? null : selesai!.toIso8601String(),
    "keterangan": keterangan == null ? null : keterangan,
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
