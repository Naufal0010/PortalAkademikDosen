import 'dart:convert';

class ModelPenawaranMataKuliahDipilih {
  ModelPenawaranMataKuliahDipilih({
    required this.data,
  });

  final List<TawarMataKuliah>? data;

  factory ModelPenawaranMataKuliahDipilih.fromJson(String str) => ModelPenawaranMataKuliahDipilih.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelPenawaranMataKuliahDipilih.fromMap(List json) => ModelPenawaranMataKuliahDipilih(
    data: json == null ? null : List<TawarMataKuliah>.from(json.map((x) => TawarMataKuliah.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class TawarMataKuliah {
  TawarMataKuliah({
    required this.idKls,
    required this.idMk,
    required this.kodeMk,
    required this.mk,
    required this.kls,
    required this.w,
    required this.kur,
    required this.semester,
    required this.sksTotal,
    required this.sksTeori,
    required this.sksPrak,
    required this.sksPrakLap,
    required this.syaratIpk,
    required this.syaratSks,
    required this.syaratSksPil,
    required this.status,
    required this.prodi,
    required this.jenjang,
  });

  final String idKls;
  final String idMk;
  final String kodeMk;
  final String mk;
  final String kls;
  final String w;
  final String kur;
  final String semester;
  final String sksTotal;
  final String sksTeori;
  final String sksPrak;
  final String sksPrakLap;
  final String syaratIpk;
  final String syaratSks;
  final String syaratSksPil;
  final String status;
  final String prodi;
  final String jenjang;

  factory TawarMataKuliah.fromJson(String str) => TawarMataKuliah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TawarMataKuliah.fromMap(Map<String, dynamic> json) => TawarMataKuliah(
    idKls: json["id_kls"] == null ? null : json["id_kls"],
    idMk: json["id_mk"] == null ? null : json["id_mk"],
    kodeMk: json["kode_mk"] == null ? null : json["kode_mk"],
    mk: json["mk"] == null ? null : json["mk"],
    kls: json["kls"] == null ? null : json["kls"],
    w: json["w"] == null ? null : json["w"],
    kur: json["kur"] == null ? null : json["kur"],
    semester: json["semester"] == null ? null : json["semester"],
    sksTotal: json["sks_total"] == null ? null : json["sks_total"],
    sksTeori: json["sks_teori"] == null ? null : json["sks_teori"],
    sksPrak: json["sks_prak"] == null ? null : json["sks_prak"],
    sksPrakLap: json["sks_prak_lap"] == null ? null : json["sks_prak_lap"],
    syaratIpk: json["syarat_ipk"] == null ? null : json["syarat_ipk"],
    syaratSks: json["syarat_sks"] == null ? null : json["syarat_sks"],
    syaratSksPil: json["syarat_sks_pil"] == null ? null : json["syarat_sks_pil"],
    status: json["status"] == null ? null : json["status"],
    prodi: json["prodi"] == null ? null : json["prodi"],
    jenjang: json["jenjang"] == null ? null : json["jenjang"],
  );

  Map<String, dynamic> toMap() => {
    "id_kls": idKls == null ? null : idKls,
    "id_mk": idMk == null ? null : idMk,
    "kode_mk": kodeMk == null ? null : kodeMk,
    "mk": mk == null ? null : mk,
    "kls": kls == null ? null : kls,
    "w": w == null ? null : w,
    "kur": kur == null ? null : kur,
    "semester": semester == null ? null : semester,
    "sks_total": sksTotal == null ? null : sksTotal,
    "sks_teori": sksTeori == null ? null : sksTeori,
    "sks_prak": sksPrak == null ? null : sksPrak,
    "sks_prak_lap": sksPrakLap == null ? null : sksPrakLap,
    "syarat_ipk": syaratIpk == null ? null : syaratIpk,
    "syarat_sks": syaratSks == null ? null : syaratSks,
    "syarat_sks_pil": syaratSksPil == null ? null : syaratSksPil,
    "status": status == null ? null : status,
    "prodi": prodi == null ? null : prodi,
    "jenjang": jenjang == null ? null : jenjang,
  };
}