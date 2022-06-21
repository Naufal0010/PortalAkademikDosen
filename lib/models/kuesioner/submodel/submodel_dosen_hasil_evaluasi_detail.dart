import 'dart:convert';

class SubModelDosenHasilEvaluasiKuesioner {
  SubModelDosenHasilEvaluasiKuesioner({
    required this.sangatTidakSetuju,
    required this.tidakSetuju,
    required this.cukupSetuju,
    required this.setuju,
    required this.sangatSetuju,
    required this.skalaLikert,
    required this.kuesioner,
  });

  final int sangatTidakSetuju;
  final int tidakSetuju;
  final int cukupSetuju;
  final int setuju;
  final int sangatSetuju;
  final String skalaLikert;
  final List<HasilKuesionerDetail>? kuesioner;

  factory SubModelDosenHasilEvaluasiKuesioner.fromJson(String str) => SubModelDosenHasilEvaluasiKuesioner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubModelDosenHasilEvaluasiKuesioner.fromMap(Map<String, dynamic> json) => SubModelDosenHasilEvaluasiKuesioner(
    sangatTidakSetuju: json["total"]["sangat_tidak_setuju"] == null ? 0 : json["total"]["sangat_tidak_setuju"],
    tidakSetuju: json["total"]["tidak_setuju"] == null ? 0 : json["total"]["tidak_setuju"],
    cukupSetuju: json["total"]["cukup_setuju"] == null ? 0: json["total"]["cukup_setuju"],
    setuju: json["total"]["setuju"] == null ? 0 : json["total"]["setuju"],
    sangatSetuju: json["total"]["sangat_setuju"] == null ? 0 : json["total"]["sangat_setuju"],
    skalaLikert: json["total"]["skala_likert"] == null ? '-' : json["total"]["skala_likert"],
    kuesioner: json["kuesioner"] == null ? null : List<HasilKuesionerDetail>.from(json["kuesioner"].map((x) => HasilKuesionerDetail.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "sangat_tidak_setuju": sangatTidakSetuju == null ? null : sangatTidakSetuju,
    "tidak_setuju": tidakSetuju == null ? null : tidakSetuju,
    "cukup_setuju": cukupSetuju == null ? null : cukupSetuju,
    "setuju": setuju == null ? null : setuju,
    "sangat_setuju": sangatSetuju == null ? null : sangatSetuju,
    "skala_likert": skalaLikert == null ? null : skalaLikert,
    "kuesioner": kuesioner == null ? null : List<dynamic>.from(kuesioner!.map((x) => x.toMap())),
  };
}

class HasilKuesionerDetail {
  HasilKuesionerDetail({
    required this.mkkurKode,
    required this.mkkurNamaResmi,
    required this.klsNama,
    required this.klsSemId,
    required this.klsId,
    required this.soal,
    required this.sangatTidakSetuju,
    required this.tidakSetuju,
    required this.cukupSetuju,
    required this.setuju,
    required this.sangatSetuju,
    required this.skalaLikert,
  });

  final String mkkurKode;
  final String mkkurNamaResmi;
  final String klsNama;
  final String klsSemId;
  final String klsId;
  final String soal;
  final String sangatTidakSetuju;
  final String tidakSetuju;
  final String cukupSetuju;
  final String setuju;
  final String sangatSetuju;
  final String skalaLikert;

  factory HasilKuesionerDetail.fromJson(String str) => HasilKuesionerDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HasilKuesionerDetail.fromMap(Map<String, dynamic> json) => HasilKuesionerDetail(
    mkkurKode: json["mkkurKode"] == null ? null : json["mkkurKode"],
    mkkurNamaResmi: json["mkkurNamaResmi"] == null ? null : json["mkkurNamaResmi"],
    klsNama: json["klsNama"] == null ? null : json["klsNama"],
    klsSemId: json["klsSemId"] == null ? null : json["klsSemId"],
    klsId: json["klsId"] == null ? null : json["klsId"],
    soal: json["soal"] == null ? null : json["soal"],
    sangatTidakSetuju: json["sangat_tidak_setuju"] == null ? null : json["sangat_tidak_setuju"],
    tidakSetuju: json["tidak_setuju"] == null ? null : json["tidak_setuju"],
    cukupSetuju: json["cukup_setuju"] == null ? null : json["cukup_setuju"],
    setuju: json["setuju"] == null ? null : json["setuju"],
    sangatSetuju: json["sangat_setuju"] == null ? null : json["sangat_setuju"],
    skalaLikert: json["skala_likert"] == null ? null : json["skala_likert"],
  );

  Map<String, dynamic> toMap() => {
    "mkkurKode": mkkurKode == null ? null : mkkurKode,
    "mkkurNamaResmi": mkkurNamaResmi == null ? null : mkkurNamaResmi,
    "klsNama": klsNama == null ? null : klsNama,
    "klsSemId": klsSemId == null ? null : klsSemId,
    "klsId": klsId == null ? null : klsId,
    "soal": soal == null ? null : soal,
    "sangat_tidak_setuju": sangatTidakSetuju == null ? null : sangatTidakSetuju,
    "tidak_setuju": tidakSetuju == null ? null : tidakSetuju,
    "cukup_setuju": cukupSetuju == null ? null : cukupSetuju,
    "setuju": setuju == null ? null : setuju,
    "sangat_setuju": sangatSetuju == null ? null : sangatSetuju,
    "skala_likert": skalaLikert == null ? null : skalaLikert,
  };
}