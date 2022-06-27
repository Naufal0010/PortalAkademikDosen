import 'dart:convert';

class ModelDosenPerwalianMahasiswa {
  ModelDosenPerwalianMahasiswa({
    required this.data,
  });

  final Data? data;

  factory ModelDosenPerwalianMahasiswa.fromJson(String str) => ModelDosenPerwalianMahasiswa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelDosenPerwalianMahasiswa.fromMap(Map<String, dynamic> json) => ModelDosenPerwalianMahasiswa(
    data: json == null ? null : Data.fromMap(json),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : data!.toMap(),
  };
}

class Data {
  Data({
    required this.rows,
    required this.limit,
    required this.offset,
  });

  List<RowMahasiswa>? rows;
  final int limit;
  final int offset;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    rows: json["rows"] == null ? null : List<RowMahasiswa>.from(json["rows"].map((x) => RowMahasiswa.fromMap(x))),
    limit: json["limit"] == null ? null : json["limit"],
    offset: json["offset"] == null ? null : json["offset"],
  );

  Map<String, dynamic> toMap() => {
    "rows": rows == null ? null : List<dynamic>.from(rows!.map((x) => x.toMap())),
    "limit": limit == null ? null : limit,
    "offset": offset == null ? null : offset,
  };
}

class RowMahasiswa {
  RowMahasiswa({
    required this.id,
    required this.mhsNim,
    required this.nip,
    required this.semester,
    required this.feederIdAktivitas,
    required this.mahasiswa,
    required this.krs,
    required this.statusBayar,
  });

  final String id;
  final String mhsNim;
  final String nip;
  final String semester;
  final dynamic feederIdAktivitas;
  final MahasiswaPerwalian? mahasiswa;
  final KrsMahasiswaPerwalian? krs;
  final StatusBayar? statusBayar;

  factory RowMahasiswa.fromJson(String str) => RowMahasiswa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RowMahasiswa.fromMap(Map<String, dynamic> json) => RowMahasiswa(
    id: json["id"] == null ? null : json["id"],
    mhsNim: json["mhsNim"] == null ? null : json["mhsNim"],
    nip: json["nip"] == null ? null : json["nip"],
    semester: json["semester"] == null ? null : json["semester"],
    feederIdAktivitas: json["feederIdAktivitas"],
    mahasiswa: json["mahasiswa"] == null ? null : MahasiswaPerwalian.fromMap(json["mahasiswa"]),
    krs: json["krs"] == null ? null : KrsMahasiswaPerwalian.fromMap(json["krs"]),
    statusBayar: json["statusBayar"] == null ? null : StatusBayar.fromMap(json["statusBayar"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "mhsNim": mhsNim == null ? null : mhsNim,
    "nip": nip == null ? null : nip,
    "semester": semester == null ? null : semester,
    "feederIdAktivitas": feederIdAktivitas,
    "mahasiswa": mahasiswa == null ? null : mahasiswa!.toMap(),
    "krs": krs == null ? null : krs!.toMap(),
    "statusBayar": statusBayar == null ? null : statusBayar!.toMap(),
  };
}

class KrsMahasiswaPerwalian {
  KrsMahasiswaPerwalian({
    required this.id,
    required this.semId,
    required this.mhsNiu,
    required this.isKirim,
    required this.isRevisi,
    required this.isSetuju,
    required this.waktuIsi,
    required this.userPengisi,
    required this.isSelesaiRevisi,
  });

  final double? id;
  final int? semId;
  final String? mhsNiu;
  final int? isKirim;
  final int? isRevisi;
  final int? isSetuju;
  final DateTime? waktuIsi;
  final String? userPengisi;
  final int? isSelesaiRevisi;

  factory KrsMahasiswaPerwalian.fromJson(String str) => KrsMahasiswaPerwalian.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KrsMahasiswaPerwalian.fromMap(Map<String, dynamic> json) => KrsMahasiswaPerwalian(
    id: json["id"] == null ? null : json["id"].toDouble(),
    semId: json["semId"] == null ? null : json["semId"],
    mhsNiu: json["mhsNiu"] == null ? null : json["mhsNiu"],
    isKirim: json["isKirim"] == null ? null : json["isKirim"],
    isRevisi: json["isRevisi"] == null ? null : json["isRevisi"],
    isSetuju: json["isSetuju"] == null ? null : json["isSetuju"],
    waktuIsi: json["waktuIsi"] == null ? null : DateTime.parse(json["waktuIsi"]),
    userPengisi: json["userPengisi"] == null ? null : json["userPengisi"],
    isSelesaiRevisi: json["isSelesaiRevisi"] == null ? null : json["isSelesaiRevisi"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "semId": semId == null ? null : semId,
    "mhsNiu": mhsNiu == null ? null : mhsNiu,
    "isKirim": isKirim == null ? null : isKirim,
    "isRevisi": isRevisi == null ? null : isRevisi,
    "isSetuju": isSetuju == null ? null : isSetuju,
    "waktuIsi": waktuIsi == null ? null : waktuIsi!.toIso8601String(),
    "userPengisi": userPengisi == null ? null : userPengisi,
    "isSelesaiRevisi": isSelesaiRevisi == null ? null : isSelesaiRevisi,
  };
}

class MahasiswaPerwalian {
  MahasiswaPerwalian({
    required this.nik,
    required this.nim,
    required this.foto,
    required this.nama,
    required this.nisn,
    required this.noHp,
    required this.npwp,
    required this.s1Pt,
    required this.email,
    required this.kurId,
    required this.s1Ipk,
    required this.wnrId,
    required this.agmrId,
    required this.ijazah,
    required this.jnspen,
    required this.noTelp,
    required this.isAsing,
    required this.kodePos,
    required this.ngrKode,
    required this.niuLama,
    required this.s1Gelar,
    required this.s1Prodi,
    required this.sbdnrId,
    required this.semAwal,
    required this.stnkrId,
    required this.angkatan,
    required this.asalSmta,
    required this.beasiswa,
    required this.feedback,
    required this.golDarah,
    required this.homepage,
    required this.jlrrKode,
    required this.kotaKode,
    required this.nomorTes,
    required this.agreement,
    required this.alamatMhs,
    required this.createdAt,
    required this.kecamatan,
    required this.kelurahan,
    required this.kodeProdi,
    required this.updatedAt,
    required this.beratBadan,
    required this.hubbiayaId,
    required this.keterangan,
    required this.lastUpdate,
    required this.s1Fakultas,
    required this.konsentrasi,
    required this.rataNilaiUn,
    required this.statrumahId,
    required this.tinggiBadan,
    required this.usernameSia,
    required this.isVerifikasi,
    required this.jenisKelamin,
    required this.ortuPassword,
    required this.reservasiPin,
    required this.s1TahunMasuk,
    required this.s1TahunTamat,
    required this.smtaKotaKode,
    required this.stakmhsrKode,
    required this.tanggalLahir,
    required this.totalNilaiUn,
    required this.jumlahSaudara,
    required this.kotaKodeLahir,
    required this.peraturanSkpi,
    required this.dariValidasiData,
    required this.konsentrasiAsing,
    required this.tanggalTerdaftar,
    required this.statusAjukanReset,
  });

  final String? nik;
  final String? nim;
  final String? foto;
  final String? nama;
  final String? nisn;
  final String? noHp;
  final String? npwp;
  final dynamic s1Pt;
  final String? email;
  final int kurId;
  final dynamic s1Ipk;
  final int wnrId;
  final int agmrId;
  final dynamic ijazah;
  final int jnspen;
  final String? noTelp;
  final int isAsing;
  final String? kodePos;
  final String? ngrKode;
  final dynamic niuLama;
  final dynamic s1Gelar;
  final dynamic s1Prodi;
  final int sbdnrId;
  final int semAwal;
  final int stnkrId;
  final int angkatan;
  final String? asalSmta;
  final String? beasiswa;
  final dynamic feedback;
  final String? golDarah;
  final String? homepage;
  final String? jlrrKode;
  final String? kotaKode;
  final String? nomorTes;
  final int agreement;
  final String? alamatMhs;
  final DateTime? createdAt;
  final String? kecamatan;
  final String? kelurahan;
  final int kodeProdi;
  final DateTime? updatedAt;
  final int beratBadan;
  final int hubbiayaId;
  final dynamic keterangan;
  final DateTime? lastUpdate;
  final dynamic s1Fakultas;
  final dynamic konsentrasi;
  final double rataNilaiUn;
  final int statrumahId;
  final int tinggiBadan;
  final String? usernameSia;
  final dynamic isVerifikasi;
  final String jenisKelamin;
  final String ortuPassword;
  final String? reservasiPin;
  final dynamic s1TahunMasuk;
  final dynamic s1TahunTamat;
  final String smtaKotaKode;
  final String stakmhsrKode;
  final DateTime? tanggalLahir;
  final double totalNilaiUn;
  final int jumlahSaudara;
  final String kotaKodeLahir;
  final int peraturanSkpi;
  final dynamic dariValidasiData;
  final dynamic konsentrasiAsing;
  final DateTime? tanggalTerdaftar;
  final dynamic statusAjukanReset;

  factory MahasiswaPerwalian.fromJson(String str) => MahasiswaPerwalian.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MahasiswaPerwalian.fromMap(Map<String, dynamic> json) => MahasiswaPerwalian(
    nik: json["nik"] == null ? null : json["nik"],
    nim: json["nim"] == null ? null : json["nim"],
    foto: json["foto"] == null ? null : json["foto"],
    nama: json["nama"] == null ? null : json["nama"],
    nisn: json["nisn"] == null ? null : json["nisn"],
    noHp: json["noHp"] == null ? null : json["noHp"],
    npwp: json["npwp"] == null ? null : json["npwp"],
    s1Pt: json["s1Pt"],
    email: json["email"] == null ? null : json["email"],
    kurId: json["kurId"] == null ? null : json["kurId"],
    s1Ipk: json["s1IPK"],
    wnrId: json["wnrId"] == null ? 0 : json["wnrId"],
    agmrId: json["agmrId"] == null ? null : json["agmrId"],
    ijazah: json["ijazah"],
    jnspen: json["jnspen"] == null ? null : json["jnspen"],
    noTelp: json["noTelp"] == null ? null : json["noTelp"],
    isAsing: json["isAsing"] == null ? null : json["isAsing"],
    kodePos: json["kodePos"] == null ? null : json["kodePos"],
    ngrKode: json["ngrKode"] == null ? null : json["ngrKode"],
    niuLama: json["niuLama"],
    s1Gelar: json["s1Gelar"],
    s1Prodi: json["s1Prodi"],
    sbdnrId: json["sbdnrId"] == null ? 0 : json["sbdnrId"],
    semAwal: json["semAwal"] == null ? null : json["semAwal"],
    stnkrId: json["stnkrId"] == null ? null : json["stnkrId"],
    angkatan: json["angkatan"] == null ? null : json["angkatan"],
    asalSmta: json["asalSmta"] == null ? null : json["asalSmta"],
    beasiswa: json["beasiswa"] == null ? null : json["beasiswa"],
    feedback: json["feedback"],
    golDarah: json["golDarah"] == null ? null : json["golDarah"],
    homepage: json["homepage"] == null ? null : json["homepage"],
    jlrrKode: json["jlrrKode"] == null ? null : json["jlrrKode"],
    kotaKode: json["kotaKode"] == null ? null : json["kotaKode"],
    nomorTes: json["nomorTes"] == null ? null : json["nomorTes"],
    agreement: json["agreement"] == null ? null : json["agreement"],
    alamatMhs: json["alamatMhs"] == null ? null : json["alamatMhs"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    kecamatan: json["kecamatan"] == null ? null : json["kecamatan"],
    kelurahan: json["kelurahan"] == null ? null : json["kelurahan"],
    kodeProdi: json["kodeProdi"] == null ? null : json["kodeProdi"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    beratBadan: json["beratBadan"] == null ? null : json["beratBadan"],
    hubbiayaId: json["hubbiayaId"] == null ? null : json["hubbiayaId"],
    keterangan: json["keterangan"],
    lastUpdate: json["lastUpdate"] == null ? null : DateTime.parse(json["lastUpdate"]),
    s1Fakultas: json["s1Fakultas"],
    konsentrasi: json["konsentrasi"],
    rataNilaiUn: json["rataNilaiUN"] == null ? null : json["rataNilaiUN"].toDouble(),
    statrumahId: json["statrumahId"] == null ? null : json["statrumahId"],
    tinggiBadan: json["tinggiBadan"] == null ? null : json["tinggiBadan"],
    usernameSia: json["usernameSia"] == null ? null : json["usernameSia"],
    isVerifikasi: json["isVerifikasi"],
    jenisKelamin: json["jenisKelamin"] == null ? null : json["jenisKelamin"],
    ortuPassword: json["ortuPassword"] == null ? null : json["ortuPassword"],
    reservasiPin: json["reservasiPin"] == null ? null : json["reservasiPin"],
    s1TahunMasuk: json["s1TahunMasuk"],
    s1TahunTamat: json["s1TahunTamat"],
    smtaKotaKode: json["smtaKotaKode"] == null ? null : json["smtaKotaKode"],
    stakmhsrKode: json["stakmhsrKode"] == null ? null : json["stakmhsrKode"],
    tanggalLahir: json["tanggalLahir"] == null ? null : DateTime.parse(json["tanggalLahir"]),
    totalNilaiUn: json["totalNilaiUN"] == null ? null : json["totalNilaiUN"].toDouble(),
    jumlahSaudara: json["jumlahSaudara"] == null ? null : json["jumlahSaudara"],
    kotaKodeLahir: json["kotaKodeLahir"] == null ? null : json["kotaKodeLahir"],
    peraturanSkpi: json["peraturanSkpi"] == null ? null : json["peraturanSkpi"],
    dariValidasiData: json["dariValidasiData"],
    konsentrasiAsing: json["konsentrasiAsing"],
    tanggalTerdaftar: json["tanggalTerdaftar"] == null ? null : DateTime.parse(json["tanggalTerdaftar"]),
    statusAjukanReset: json["statusAjukanReset"],
  );

  Map<String, dynamic> toMap() => {
    "nik": nik == null ? null : nik,
    "nim": nim == null ? null : nim,
    "foto": foto == null ? null : foto,
    "nama": nama == null ? null : nama,
    "nisn": nisn == null ? null : nisn,
    "noHp": noHp == null ? null : noHp,
    "npwp": npwp == null ? null : npwp,
    "s1Pt": s1Pt,
    "email": email == null ? null : email,
    "kurId": kurId == null ? null : kurId,
    "s1IPK": s1Ipk,
    "wnrId": wnrId == null ? null : wnrId,
    "agmrId": agmrId == null ? null : agmrId,
    "ijazah": ijazah,
    "jnspen": jnspen == null ? null : jnspen,
    "noTelp": noTelp == null ? null : noTelp,
    "isAsing": isAsing == null ? null : isAsing,
    "kodePos": kodePos == null ? null : kodePos,
    "ngrKode": ngrKode == null ? null : ngrKode,
    "niuLama": niuLama,
    "s1Gelar": s1Gelar,
    "s1Prodi": s1Prodi,
    "sbdnrId": sbdnrId == null ? null : sbdnrId,
    "semAwal": semAwal == null ? null : semAwal,
    "stnkrId": stnkrId == null ? null : stnkrId,
    "angkatan": angkatan == null ? null : angkatan,
    "asalSmta": asalSmta == null ? null : asalSmta,
    "beasiswa": beasiswa == null ? null : beasiswa,
    "feedback": feedback,
    "golDarah": golDarah == null ? null : golDarah,
    "homepage": homepage == null ? null : homepage,
    "jlrrKode": jlrrKode == null ? null : jlrrKode,
    "kotaKode": kotaKode == null ? null : kotaKode,
    "nomorTes": nomorTes == null ? null : nomorTes,
    "agreement": agreement == null ? null : agreement,
    "alamatMhs": alamatMhs == null ? null : alamatMhs,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "kecamatan": kecamatan == null ? null : kecamatan,
    "kelurahan": kelurahan == null ? null : kelurahan,
    "kodeProdi": kodeProdi == null ? null : kodeProdi,
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "beratBadan": beratBadan == null ? null : beratBadan,
    "hubbiayaId": hubbiayaId == null ? null : hubbiayaId,
    "keterangan": keterangan,
    "lastUpdate": lastUpdate == null ? null : lastUpdate!.toIso8601String(),
    "s1Fakultas": s1Fakultas,
    "konsentrasi": konsentrasi,
    "rataNilaiUN": rataNilaiUn == null ? null : rataNilaiUn,
    "statrumahId": statrumahId == null ? null : statrumahId,
    "tinggiBadan": tinggiBadan == null ? null : tinggiBadan,
    "usernameSia": usernameSia == null ? null : usernameSia,
    "isVerifikasi": isVerifikasi,
    "jenisKelamin": jenisKelamin == null ? null : jenisKelamin,
    "ortuPassword": ortuPassword == null ? null : ortuPassword,
    "reservasiPin": reservasiPin == null ? null : reservasiPin,
    "s1TahunMasuk": s1TahunMasuk,
    "s1TahunTamat": s1TahunTamat,
    "smtaKotaKode": smtaKotaKode == null ? null : smtaKotaKode,
    "stakmhsrKode": stakmhsrKode == null ? null : stakmhsrKode,
    "tanggalLahir": tanggalLahir == null ? null : "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
    "totalNilaiUN": totalNilaiUn == null ? null : totalNilaiUn,
    "jumlahSaudara": jumlahSaudara == null ? null : jumlahSaudara,
    "kotaKodeLahir": kotaKodeLahir == null ? null : kotaKodeLahir,
    "peraturanSkpi": peraturanSkpi == null ? null : peraturanSkpi,
    "dariValidasiData": dariValidasiData,
    "konsentrasiAsing": konsentrasiAsing,
    "tanggalTerdaftar": tanggalTerdaftar == null ? null : "${tanggalTerdaftar!.year.toString().padLeft(4, '0')}-${tanggalTerdaftar!.month.toString().padLeft(2, '0')}-${tanggalTerdaftar!.day.toString().padLeft(2, '0')}",
    "statusAjukanReset": statusAjukanReset,
  };
}

class StatusBayar {
  StatusBayar({
    required this.mhsNim,
    required this.channel,
    required this.jatakSks,
    required this.jnsBayar,
    required this.namaBank,
    required this.isBeasiswa,
    required this.semesterId,
    required this.totalBayar,
    required this.kodeTerminal,
    required this.tanggalBayar,
    required this.isKeringananUkt,
  });

  final String? mhsNim;
  final dynamic channel;
  final dynamic jatakSks;
  final String? jnsBayar;
  final dynamic namaBank;
  final dynamic isBeasiswa;
  final int? semesterId;
  final int? totalBayar;
  final dynamic kodeTerminal;
  final DateTime? tanggalBayar;
  final int? isKeringananUkt;

  factory StatusBayar.fromJson(String str) => StatusBayar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatusBayar.fromMap(Map<String, dynamic> json) => StatusBayar(
    mhsNim: json["mhsNim"] == null ? null : json["mhsNim"],
    channel: json["channel"],
    jatakSks: json["jatakSks"],
    jnsBayar: json["jnsBayar"] == null ? null : json["jnsBayar"],
    namaBank: json["namaBank"],
    isBeasiswa: json["isBeasiswa"],
    semesterId: json["semesterId"] == null ? null : json["semesterId"],
    totalBayar: json["totalBayar"] == null ? null : json["totalBayar"],
    kodeTerminal: json["kodeTerminal"],
    tanggalBayar: json["tanggalBayar"] == null ? null : DateTime.parse(json["tanggalBayar"]),
    isKeringananUkt: json["isKeringananUkt"] == null ? null : json["isKeringananUkt"],
  );

  Map<String, dynamic> toMap() => {
    "mhsNim": mhsNim == null ? null : mhsNim,
    "channel": channel,
    "jatakSks": jatakSks,
    "jnsBayar": jnsBayar == null ? null : jnsBayar,
    "namaBank": namaBank,
    "isBeasiswa": isBeasiswa,
    "semesterId": semesterId == null ? null : semesterId,
    "totalBayar": totalBayar == null ? null : totalBayar,
    "kodeTerminal": kodeTerminal,
    "tanggalBayar": tanggalBayar == null ? null : tanggalBayar!.toIso8601String(),
    "isKeringananUkt": isKeringananUkt == null ? null : isKeringananUkt,
  };
}
