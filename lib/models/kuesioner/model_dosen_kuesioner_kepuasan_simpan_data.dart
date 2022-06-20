import 'dart:convert';

class ModelDosenKuesionerKepuasanSimpanData {
  ModelDosenKuesionerKepuasanSimpanData({
    required this.dosenId,
    required this.jawabanKuisioner,
  });

  String dosenId;
  List<JawabanKuisioner>? jawabanKuisioner;

  factory ModelDosenKuesionerKepuasanSimpanData.fromJson(String str) =>
      ModelDosenKuesionerKepuasanSimpanData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelDosenKuesionerKepuasanSimpanData.fromMap(
          Map<String, dynamic> json) =>
      ModelDosenKuesionerKepuasanSimpanData(
        dosenId: json["dosenId"] == null ? null : json["dosenId"],
        jawabanKuisioner: json["jawabanKuisioner"] == null
            ? null
            : List<JawabanKuisioner>.from(json["jawabanKuisioner"]
                .map((x) => JawabanKuisioner.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "dosenId": dosenId == null ? null : dosenId,
        "jawabanKuisioner": jawabanKuisioner == null
            ? null
            : List<dynamic>.from(jawabanKuisioner!.map((x) => x.toMap())),
      };
}

class JawabanKuisioner {
  JawabanKuisioner({
    required this.bobot,
    required this.idSoal,
  });

  String bobot;
  String idSoal;

  factory JawabanKuisioner.fromJson(String str) =>
      JawabanKuisioner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JawabanKuisioner.fromMap(Map<String, dynamic> json) =>
      JawabanKuisioner(
        bobot: json["bobot"] == null ? null : json["bobot"],
        idSoal: json["idSoal"] == null ? null : json["idSoal"],
      );

  Map<String, dynamic> toMap() => {
        "bobot": bobot == null ? null : bobot,
        "idSoal": idSoal == null ? null : idSoal,
      };
}
