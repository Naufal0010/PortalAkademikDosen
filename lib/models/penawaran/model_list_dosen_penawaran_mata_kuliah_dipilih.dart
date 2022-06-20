import 'dart:convert';

class ModelListDosenPenawaranMataKuliah {
  ModelListDosenPenawaranMataKuliah({
    required this.data,
  });

  final ListPenawaran? data;

  factory ModelListDosenPenawaranMataKuliah.fromJson(String str) => ModelListDosenPenawaranMataKuliah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelListDosenPenawaranMataKuliah.fromMap(Map<String, dynamic> json) => ModelListDosenPenawaranMataKuliah(
    data: json == null ? null : ListPenawaran.fromMap(json),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : data!.toMap(),
  };
}

class ListPenawaran {
  ListPenawaran({
    required this.dosenAmpu,
    required this.mkPrasyarat,
    required this.mkJumlahPeserta,
  });

  final List<DosenAmpu>? dosenAmpu;
  final List<MkPrasyarat>? mkPrasyarat;
  final String mkJumlahPeserta;

  factory ListPenawaran.fromJson(String str) => ListPenawaran.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListPenawaran.fromMap(Map<String, dynamic> json) => ListPenawaran(
    dosenAmpu: json["dosen_ampu"] == null ? null : List<DosenAmpu>.from(json["dosen_ampu"].map((x) => DosenAmpu.fromMap(x))),
    mkPrasyarat: json["mk_prasyarat"] == null ? null : List<MkPrasyarat>.from(json["mk_prasyarat"].map((x) => MkPrasyarat.fromMap(x))),
    mkJumlahPeserta: json["mk_jumlahPeserta"] == null ? null : json["mk_jumlahPeserta"],
  );

  Map<String, dynamic> toMap() => {
    "dosen_ampu": dosenAmpu == null ? null : List<dynamic>.from(dosenAmpu!.map((x) => x.toMap())),
    "mk_prasyarat": mkPrasyarat == null ? null : List<dynamic>.from(mkPrasyarat!.map((x) => x.toMap())),
    "mk_jumlahPeserta": mkJumlahPeserta == null ? null : mkJumlahPeserta,
  };
}

class DosenAmpu {
  DosenAmpu({
    required this.nip,
    required this.nama,
    required this.prodi,
  });

  final String nip;
  final String nama;
  final String prodi;

  factory DosenAmpu.fromJson(String str) => DosenAmpu.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DosenAmpu.fromMap(Map<String, dynamic> json) => DosenAmpu(
    nip: json["nip"] == null ? null : json["nip"],
    nama: json["nama"] == null ? null : json["nama"],
    prodi: json["prodi"] == null ? null : json["prodi"],
  );

  Map<String, dynamic> toMap() => {
    "nip": nip == null ? null : nip,
    "nama": nama == null ? null : nama,
    "prodi": prodi == null ? null : prodi,
  };
}

class MkPrasyarat {
  MkPrasyarat({
    required this.id,
    required this.kode,
    required this.nama,
    required this.syaratKode,
    required this.syarat,
    required this.bobot,
  });

  final String id;
  final String kode;
  final String nama;
  final String syaratKode;
  final String syarat;
  final String bobot;

  factory MkPrasyarat.fromJson(String str) => MkPrasyarat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MkPrasyarat.fromMap(Map<String, dynamic> json) => MkPrasyarat(
    id: json["id"] == null ? null : json["id"],
    kode: json["kode"] == null ? null : json["kode"],
    nama: json["nama"] == null ? null : json["nama"],
    syaratKode: json["syarat_kode"] == null ? null : json["syarat_kode"],
    syarat: json["syarat"] == null ? null : json["syarat"],
    bobot: json["bobot"] == null ? null : json["bobot"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "kode": kode == null ? null : kode,
    "nama": nama == null ? null : nama,
    "syarat_kode": syaratKode == null ? null : syaratKode,
    "syarat": syarat == null ? null : syarat,
    "bobot": bobot == null ? null : bobot,
  };
}
