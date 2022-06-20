import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/dashboard_page.dart';

import '../../data/repository/network_repository.dart';
import '../../models/kuesioner/model_dosen_kuesioner_kepuasan.dart';
import '../../models/kuesioner/model_dosen_kuesioner_kepuasan_simpan_data.dart';
import '../../models/model_api.dart';
import '../../utils/api_local_store.dart';
import '../../utils/service/logger.dart';

class DosenKuesionerKepuasanState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelDosenKuesionerKepuasan? data;
  ModelDosenKuesionerKepuasanSimpanData? simpanData;
  Map<String, dynamic>? error;
  String errorMessage = '';
  bool isLoading = true;

  Future<void> initData(String nipDosen) async {
    final res =
        await NetworkRepository().getKuesionerKepuasanPenilaianDosen(nipDosen);
    if (res.code == CODE.SUCCESS) {
      data = ModelDosenKuesionerKepuasan.fromMap(res.data);
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Kuesioner Kepuasan', data?.toJson());
    } else if (res.code == CODE.ERROR) {
      isLoading = false;
      error = res.message;
      notifyListeners();
    } else {
      isLoading = false;
      errorMessage = res.message;
      notifyListeners();
    }
  }

  Future<void> postDataKuesionerKepuasanDosen(BuildContext context) async {
    simpanData!.dosenId = data!.dosenId;
    UtilLogger.log('dosen ID', simpanData!.dosenId);
    final res = await NetworkRepository()
        .postTambahDataKuesionerKepuasanDosen(simpanData!);
    UtilLogger.log('Post data Kuesioner Kepuasan', res);
    if (res.code == CODE.SUCCESS) {
      refreshData();
      Navigator.of(context)
          .pop(MaterialPageRoute(builder: (context) => DashboardPage()));
      UtilLogger.log('Post data Kuesioner Kepuasan', data);
    } else {
      final snackBar = SnackBar(
          content: Text('Item masih ada yang belum diisi, silakan lengkapi'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      notifyListeners();
    }
  }

  simpanDataKuesionerKepuasanDosen(String idSoal, String bobot) {
    if (simpanData == null) {
      simpanData = new ModelDosenKuesionerKepuasanSimpanData(
          dosenId: data!.dosenId, jawabanKuisioner: []);
    }

    simpanData?.jawabanKuisioner!.add(JawabanKuisioner(
        idSoal: idSoal, bobot: bobot));

    simpanData?.jawabanKuisioner = simpanData!.jawabanKuisioner!.map((e) {
      if (e.idSoal == idSoal) {
        e.idSoal = idSoal;
        e.bobot = bobot;
      }

      return e;
    }).toList();
    UtilLogger.log('Tambah data bintang', simpanData!.toMap());
  }

  Future<void> refreshData() async {
    error = null;
    errorMessage = '';
    data = null;
    isLoading = true;
    notifyListeners();
    initData(ApiLocalStorage.modelProfilDosen!.nip);
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
