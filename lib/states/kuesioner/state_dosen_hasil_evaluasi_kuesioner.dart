import 'package:flutter/foundation.dart';

import '../../data/repository/network_repository.dart';
import '../../models/kuesioner/model_dosen_hasil_evaluasi_kuesioner.dart';
import '../../models/model_api.dart';
import '../../utils/service/logger.dart';

class DosenHasilEvaluasiKuesionerState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelDosenHasilEvaluasiDosen? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  Future<void> initData(String semId) async {
    final res = await NetworkRepository().getDataHasilKuesionerDosen(semId);
    if (res.code == CODE.SUCCESS) {
      data = ModelDosenHasilEvaluasiDosen.fromMap(res.data);
      UtilLogger.log('Data Hasil Kuesioner', data!.toJson());
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
    data = null;
    isLoading = true;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
