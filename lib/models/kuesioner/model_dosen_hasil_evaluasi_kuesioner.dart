import 'dart:convert';

class ModelDosenHasilEvaluasiDosen {
  ModelDosenHasilEvaluasiDosen({
    required this.data,
  });

  final List<HasilEvaluasi>? data;

  factory ModelDosenHasilEvaluasiDosen.fromJson(String str) => ModelDosenHasilEvaluasiDosen.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelDosenHasilEvaluasiDosen.fromMap(List json) => ModelDosenHasilEvaluasiDosen(
    data: json == null ? null : List<HasilEvaluasi>.from(json.map((x) => HasilEvaluasi.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class HasilEvaluasi {
  HasilEvaluasi({
    required this.mkkurKode,
    required this.mkkurNamaResmi,
    required this.klsNama,
    required this.klsId,
    required this.sks,
    required this.prodiNamaResmi,
    required this.prodiJjarKode,
    required this.baik,
    required this.kurang,
  });

  final String mkkurKode;
  final String mkkurNamaResmi;
  final String klsNama;
  final String klsId;
  final String sks;
  final String prodiNamaResmi;
  final String prodiJjarKode;
  final String baik;
  final String kurang;

  factory HasilEvaluasi.fromJson(String str) => HasilEvaluasi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HasilEvaluasi.fromMap(Map<String, dynamic> json) => HasilEvaluasi(
    mkkurKode: json["mkkurKode"] == null ? null : json["mkkurKode"],
    mkkurNamaResmi: json["mkkurNamaResmi"] == null ? null : json["mkkurNamaResmi"],
    klsNama: json["klsNama"] == null ? null : json["klsNama"],
    klsId: json["klsId"] == null ? null : json["klsId"],
    sks: json["sks"] == null ? null : json["sks"],
    prodiNamaResmi: json["prodiNamaResmi"] == null ? null : json["prodiNamaResmi"],
    prodiJjarKode: json["prodiJjarKode"] == null ? null : json["prodiJjarKode"],
    baik: json["baik"] == null ? null : json["baik"],
    kurang: json["kurang"] == null ? null : json["kurang"],
  );

  Map<String, dynamic> toMap() => {
    "mkkurKode": mkkurKode == null ? null : mkkurKode,
    "mkkurNamaResmi": mkkurNamaResmi == null ? null : mkkurNamaResmi,
    "klsNama": klsNama == null ? null : klsNama,
    "klsId": klsId == null ? null : klsId,
    "sks": sks == null ? null : sks,
    "prodiNamaResmi": prodiNamaResmi == null ? null : prodiNamaResmi,
    "prodiJjarKode": prodiJjarKode == null ? null : prodiJjarKode,
    "baik": baik == null ? null : baik,
    "kurang": kurang == null ? null : kurang,
  };
}
