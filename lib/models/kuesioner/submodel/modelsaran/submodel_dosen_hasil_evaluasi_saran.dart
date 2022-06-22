import 'dart:convert';

class SubModelDosenHasilEvaluasiKuesionerSaran {
  SubModelDosenHasilEvaluasiKuesionerSaran({
    required this.dosen,
    required this.saran,
  });

  final List<DosenList>? dosen;
  final List<Map<String, dynamic>?>? saran;

  factory SubModelDosenHasilEvaluasiKuesionerSaran.fromJson(String str) => SubModelDosenHasilEvaluasiKuesionerSaran.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubModelDosenHasilEvaluasiKuesionerSaran.fromMap(Map<String, dynamic> json) => SubModelDosenHasilEvaluasiKuesionerSaran(
    dosen: json["dosen"] == null ? null : List<DosenList>.from(json["dosen"].map((x) => DosenList.fromMap(x))),
    saran: json["saran"] == null ? null : List<Map<String, dynamic>>.from(json["saran"]),
    // saran: json["saran"] == null ? null : Map.from(json["saran"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
  );

  Map<String, dynamic> toMap() => {
    "dosen": dosen == null ? null : List<dynamic>.from(dosen!.map((x) => x.toMap())),
    "saran": saran == null ? null : List<dynamic>.from(saran!),
    // "saran": saran == null ? null : Map.from(saran!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class DosenList {
  DosenList({
    required this.klsId,
    required this.nip,
    required this.dosenKe,
    required this.isBolehInput,
    required this.dosen,
  });

  final String klsId;
  final String nip;
  final String dosenKe;
  final String isBolehInput;
  final DosenKuesioner? dosen;

  factory DosenList.fromJson(String str) => DosenList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DosenList.fromMap(Map<String, dynamic> json) => DosenList(
    klsId: json["klsId"] == null ? null : json["klsId"],
    nip: json["nip"] == null ? null : json["nip"],
    dosenKe: json["dosenKe"] == null ? null : json["dosenKe"],
    isBolehInput: json["isBolehInput"] == null ? null : json["isBolehInput"],
    dosen: json["dosen"] == null ? null : DosenKuesioner.fromMap(json["dosen"]),
  );

  Map<String, dynamic> toMap() => {
    "klsId": klsId == null ? null : klsId,
    "nip": nip == null ? null : nip,
    "dosenKe": dosenKe == null ? null : dosenKe,
    "isBolehInput": isBolehInput == null ? null : isBolehInput,
    "dosen": dosen == null ? null : dosen!.toMap(),
  };
}

class DosenKuesioner {
  DosenKuesioner({
    required this.nama,
    required this.nidn,
  });

  final String nama;
  final String nidn;

  factory DosenKuesioner.fromJson(String str) => DosenKuesioner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DosenKuesioner.fromMap(Map<String, dynamic> json) => DosenKuesioner(
    nama: json["nama"] == null ? null : json["nama"],
    nidn: json["nidn"] == null ? null : json["nidn"],
  );

  Map<String, dynamic> toMap() => {
    "nama": nama == null ? null : nama,
    "nidn": nidn == null ? null : nidn,
  };
}