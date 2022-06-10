import 'dart:convert';

class ModelProfilDosen {
  ModelProfilDosen({
    required this.nip,
    required this.nama,
    required this.nidn,
    required this.tempatLahir,
    required this.tglLahir,
    required this.jenisKelamin,
    required this.agama,
    required this.kodeProdi,
    required this.statuDosen,
    required this.statusAktif,
    required this.gelarDepan,
    required this.gelarBelakang,
    required this.foto,
    required this.noHp,
    required this.email,
    required this.alamatRumah,
    required this.alamatRumahPresensi,
    required this.alamatRumahKota,
    required this.alamatKantor,
    required this.alamatKantorKota,
    required this.meluluskanS0,
    required this.meluluskanS1,
    required this.meluluskanS2,
    required this.noSertifikatDosen,
    required this.tglSerdos,
    required this.tmtPensiun,
    required this.statusHonorer,
    required this.homebaseFakultas,
    required this.feederIdSdm,
    required this.golDarah,
    required this.statusKepegawaian,
    required this.createdAt,
    required this.updatedAt,
    required this.jurusan,
    required this.prodi,
    required this.fakultas,
  });

  final String nip;
  final String nama;
  final String nidn;
  final String tempatLahir;
  final DateTime? tglLahir;
  final String jenisKelamin;
  final String agama;
  final String kodeProdi;
  final String statuDosen;
  final String statusAktif;
  final String gelarDepan;
  final String gelarBelakang;
  final String foto;
  final String noHp;
  final String email;
  final String alamatRumah;
  final String alamatRumahPresensi;
  final String alamatRumahKota;
  final String alamatKantor;
  final String alamatKantorKota;
  final dynamic meluluskanS0;
  final dynamic meluluskanS1;
  final dynamic meluluskanS2;
  final String noSertifikatDosen;
  final String tglSerdos;
  final String tmtPensiun;
  final dynamic statusHonorer;
  final String homebaseFakultas;
  final String feederIdSdm;
  final String golDarah;
  final String statusKepegawaian;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final JurusanDosen? jurusan;
  final ProdiDosen? prodi;
  final FakultasDosen? fakultas;

  factory ModelProfilDosen.fromJson(String str) => ModelProfilDosen.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelProfilDosen.fromMap(Map<String, dynamic> json) => ModelProfilDosen(
    nip: json["nip"] == null ? null : json["nip"],
    nama: json["nama"] == null ? null : json["nama"],
    nidn: json["nidn"] == null ? null : json["nidn"],
    tempatLahir: json["tempatLahir"] == null ? null : json["tempatLahir"],
    tglLahir: json["tglLahir"] == null ? null : DateTime.parse(json["tglLahir"]),
    jenisKelamin: json["jenisKelamin"] == null ? null : json["jenisKelamin"],
    agama: json["agama"] == null ? null : json["agama"],
    kodeProdi: json["kodeProdi"] == null ? null : json["kodeProdi"],
    statuDosen: json["statuDosen"] == null ? null : json["statuDosen"],
    statusAktif: json["statusAktif"] == null ? null : json["statusAktif"],
    gelarDepan: json["gelarDepan"] == null ? null : json["gelarDepan"],
    gelarBelakang: json["gelarBelakang"] == null ? null : json["gelarBelakang"],
    foto: json["foto"] == null ? null : json["foto"],
    noHp: json["noHp"] == null ? null : json["noHp"],
    email: json["email"] == null ? null : json["email"],
    alamatRumah: json["alamatRumah"] == null ? null : json["alamatRumah"],
    alamatRumahPresensi: json["alamatRumahPresensi"] == null ? null : json["alamatRumahPresensi"],
    alamatRumahKota: json["alamatRumahKota"] == null ? null : json["alamatRumahKota"],
    alamatKantor: json["alamatKantor"] == null ? null : json["alamatKantor"],
    alamatKantorKota: json["alamatKantorKota"] == null ? null : json["alamatKantorKota"],
    meluluskanS0: json["meluluskanS0"],
    meluluskanS1: json["meluluskanS1"],
    meluluskanS2: json["meluluskanS2"],
    noSertifikatDosen: json["noSertifikatDosen"] == null ? null : json["noSertifikatDosen"],
    tglSerdos: json["tglSerdos"] == null ? null : json["tglSerdos"],
    tmtPensiun: json["tmtPensiun"] == null ? null : json["tmtPensiun"],
    statusHonorer: json["statusHonorer"],
    homebaseFakultas: json["homebaseFakultas"] == null ? null : json["homebaseFakultas"],
    feederIdSdm: json["feederIdSdm"] == null ? null : json["feederIdSdm"],
    golDarah: json["golDarah"] == null ? null : json["golDarah"],
    statusKepegawaian: json["statusKepegawaian"] == null ? null : json["statusKepegawaian"],
    createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
    updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
    jurusan: json["jurusan"] == null ? null : JurusanDosen.fromMap(json["jurusan"]),
    prodi: json["prodi"] == null ? null : ProdiDosen.fromMap(json["prodi"]),
    fakultas: json["fakultas"] == null ? null : FakultasDosen.fromMap(json["fakultas"]),
  );

  Map<String, dynamic> toMap() => {
    "nip": nip == null ? null : nip,
    "nama": nama == null ? null : nama,
    "nidn": nidn == null ? null : nidn,
    "tempatLahir": tempatLahir == null ? null : tempatLahir,
    "tglLahir": tglLahir == null ? null : "${tglLahir?.year.toString().padLeft(4, '0')}-${tglLahir?.month.toString().padLeft(2, '0')}-${tglLahir?.day.toString().padLeft(2, '0')}",
    "jenisKelamin": jenisKelamin == null ? null : jenisKelamin,
    "agama": agama == null ? null : agama,
    "kodeProdi": kodeProdi == null ? null : kodeProdi,
    "statuDosen": statuDosen == null ? null : statuDosen,
    "statusAktif": statusAktif == null ? null : statusAktif,
    "gelarDepan": gelarDepan == null ? null : gelarDepan,
    "gelarBelakang": gelarBelakang == null ? null : gelarBelakang,
    "foto": foto == null ? null : foto,
    "noHp": noHp == null ? null : noHp,
    "email": email == null ? null : email,
    "alamatRumah": alamatRumah == null ? null : alamatRumah,
    "alamatRumahPresensi": alamatRumahPresensi == null ? null : alamatRumahPresensi,
    "alamatRumahKota": alamatRumahKota == null ? null : alamatRumahKota,
    "alamatKantor": alamatKantor == null ? null : alamatKantor,
    "alamatKantorKota": alamatKantorKota == null ? null : alamatKantorKota,
    "meluluskanS0": meluluskanS0,
    "meluluskanS1": meluluskanS1,
    "meluluskanS2": meluluskanS2,
    "noSertifikatDosen": noSertifikatDosen == null ? null : noSertifikatDosen,
    "tglSerdos": tglSerdos == null ? null : tglSerdos,
    "tmtPensiun": tmtPensiun == null ? null : tmtPensiun,
    "statusHonorer": statusHonorer,
    "homebaseFakultas": homebaseFakultas == null ? null : homebaseFakultas,
    "feederIdSdm": feederIdSdm == null ? null : feederIdSdm,
    "golDarah": golDarah == null ? null : golDarah,
    "statusKepegawaian": statusKepegawaian == null ? null : statusKepegawaian,
    "CreatedAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "UpdatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "jurusan": jurusan == null ? null : jurusan!.toMap(),
    "prodi": prodi == null ? null : prodi!.toMap(),
    "fakultas": fakultas == null ? null : fakultas!.toMap(),
  };
}

class FakultasDosen {
  FakultasDosen({
    required this.fax,
    required this.kode,
    required this.kota,
    required this.telp,
    required this.dekan,
    required this.email,
    required this.aDekan,
    required this.alamat,
    required this.kodeUniv,
    required this.createdAt,
    required this.namaAsing,
    required this.namaResmi,
    required this.updatedAt,
    required this.namaSingkat,
  });

  final String fax;
  final int kode;
  final String kota;
  final String telp;
  final String dekan;
  final String email;
  final String aDekan;
  final String alamat;
  final String kodeUniv;
  final DateTime? createdAt;
  final String namaAsing;
  final String namaResmi;
  final DateTime? updatedAt;
  final String namaSingkat;

  factory FakultasDosen.fromJson(String str) => FakultasDosen.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FakultasDosen.fromMap(Map<String, dynamic> json) => FakultasDosen(
    fax: json["fax"] == null ? null : json["fax"],
    kode: json["kode"] == null ? null : json["kode"],
    kota: json["kota"] == null ? null : json["kota"],
    telp: json["telp"] == null ? null : json["telp"],
    dekan: json["dekan"] == null ? null : json["dekan"],
    email: json["email"] == null ? null : json["email"],
    aDekan: json["aDekan"] == null ? null : json["aDekan"],
    alamat: json["alamat"] == null ? null : json["alamat"],
    kodeUniv: json["kodeUniv"] == null ? null : json["kodeUniv"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    namaAsing: json["namaAsing"] == null ? null : json["namaAsing"],
    namaResmi: json["namaResmi"] == null ? null : json["namaResmi"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    namaSingkat: json["namaSingkat"] == null ? null : json["namaSingkat"],
  );

  Map<String, dynamic> toMap() => {
    "fax": fax == null ? null : fax,
    "kode": kode == null ? null : kode,
    "kota": kota == null ? null : kota,
    "telp": telp == null ? null : telp,
    "dekan": dekan == null ? null : dekan,
    "email": email == null ? null : email,
    "aDekan": aDekan == null ? null : aDekan,
    "alamat": alamat == null ? null : alamat,
    "kodeUniv": kodeUniv == null ? null : kodeUniv,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "namaAsing": namaAsing == null ? null : namaAsing,
    "namaResmi": namaResmi == null ? null : namaResmi,
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "namaSingkat": namaSingkat == null ? null : namaSingkat,
  };
}

class JurusanDosen {
  JurusanDosen({
    required this.fax,
    required this.kode,
    required this.telp,
    required this.email,
    required this.kajur,
    required this.alamat,
    required this.fakKode,
    required this.createdAt,
    required this.namaResmi,
    required this.updatedAt,
    required this.namaSingkat,
  });

  final dynamic fax;
  final int kode;
  final dynamic telp;
  final dynamic email;
  final dynamic kajur;
  final dynamic alamat;
  final int fakKode;
  final DateTime? createdAt;
  final String namaResmi;
  final DateTime? updatedAt;
  final String namaSingkat;

  factory JurusanDosen.fromJson(String str) => JurusanDosen.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JurusanDosen.fromMap(Map<String, dynamic> json) => JurusanDosen(
    fax: json["fax"],
    kode: json["kode"] == null ? null : json["kode"],
    telp: json["telp"],
    email: json["email"],
    kajur: json["kajur"],
    alamat: json["alamat"],
    fakKode: json["fakKode"] == null ? null : json["fakKode"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    namaResmi: json["namaResmi"] == null ? null : json["namaResmi"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    namaSingkat: json["namaSingkat"] == null ? null : json["namaSingkat"],
  );

  Map<String, dynamic> toMap() => {
    "fax": fax,
    "kode": kode == null ? null : kode,
    "telp": telp,
    "email": email,
    "kajur": kajur,
    "alamat": alamat,
    "fakKode": fakKode == null ? null : fakKode,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "namaResmi": namaResmi == null ? null : namaResmi,
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "namaSingkat": namaSingkat == null ? null : namaSingkat,
  };
}

class ProdiDosen {
  ProdiDosen({
    required this.kode,
    required this.nama,
    required this.gelar,
    required this.jenjang,
    required this.createdAt,
    required this.namaAsing,
    required this.updatedAt,
    required this.gelarAsing,
    required this.statusProfesi,
    required this.gelarKelulusan,
    required this.jenisPendidikan,
    required this.syaratPenerimaan,
    required this.programPendidikan,
    required this.pendidikanLanjutan,
  });

  final int kode;
  final String nama;
  final String gelar;
  final String jenjang;
  final DateTime? createdAt;
  final String namaAsing;
  final DateTime? updatedAt;
  final String gelarAsing;
  final String statusProfesi;
  final String gelarKelulusan;
  final String jenisPendidikan;
  final String syaratPenerimaan;
  final String programPendidikan;
  final String pendidikanLanjutan;

  factory ProdiDosen.fromJson(String str) => ProdiDosen.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProdiDosen.fromMap(Map<String, dynamic> json) => ProdiDosen(
    kode: json["kode"] == null ? null : json["kode"],
    nama: json["nama"] == null ? null : json["nama"],
    gelar: json["gelar"] == null ? null : json["gelar"],
    jenjang: json["jenjang"] == null ? null : json["jenjang"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    namaAsing: json["namaAsing"] == null ? null : json["namaAsing"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    gelarAsing: json["gelarAsing"] == null ? null : json["gelarAsing"],
    statusProfesi: json["statusProfesi"] == null ? null : json["statusProfesi"],
    gelarKelulusan: json["gelarKelulusan"] == null ? null : json["gelarKelulusan"],
    jenisPendidikan: json["jenisPendidikan"] == null ? null : json["jenisPendidikan"],
    syaratPenerimaan: json["syaratPenerimaan"] == null ? null : json["syaratPenerimaan"],
    programPendidikan: json["programPendidikan"] == null ? null : json["programPendidikan"],
    pendidikanLanjutan: json["pendidikanLanjutan"] == null ? null : json["pendidikanLanjutan"],
  );

  Map<String, dynamic> toMap() => {
    "kode": kode == null ? null : kode,
    "nama": nama == null ? null : nama,
    "gelar": gelar == null ? null : gelar,
    "jenjang": jenjang == null ? null : jenjang,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "namaAsing": namaAsing == null ? null : namaAsing,
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "gelarAsing": gelarAsing == null ? null : gelarAsing,
    "statusProfesi": statusProfesi == null ? null : statusProfesi,
    "gelarKelulusan": gelarKelulusan == null ? null : gelarKelulusan,
    "jenisPendidikan": jenisPendidikan == null ? null : jenisPendidikan,
    "syaratPenerimaan": syaratPenerimaan == null ? null : syaratPenerimaan,
    "programPendidikan": programPendidikan == null ? null : programPendidikan,
    "pendidikanLanjutan": pendidikanLanjutan == null ? null : pendidikanLanjutan,
  };
}
