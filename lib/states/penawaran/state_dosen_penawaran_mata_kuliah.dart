import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/models/penawaran/model_penawaran_mata_kuliah.dart';
import 'package:portal_akademik_dosen/models/penawaran/model_penawaran_mata_kuliah_list.dart';

import '../../data/repository/network_repository.dart';
import '../../models/model_api.dart';
import '../../utils/service/logger.dart';

class DosenPenawaranMataKuliahState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelPenawaranMataKuliah? dataPaketSemester;
  ModelDosenPenawaranMataKuliah? paketSemester;
  Map<String, dynamic>? error;
  bool isLoading = true;

  DosenPenawaranMataKuliahState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getPenawaranMataKuliah();
    if (res.code == CODE.SUCCESS) {
      dataPaketSemester = ModelPenawaranMataKuliah.fromMap(res.data);
      UtilLogger.log('Paket Semester', dataPaketSemester!.toJson());
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      error = res.message;
      notifyListeners();
    }
  }

  Future<void> refreshData() async {
    error = null;
    dataPaketSemester = null;
    isLoading = true;
    notifyListeners();
    initData();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
