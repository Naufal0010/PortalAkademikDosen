import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/models/kuesioner/submodel/modelsaran/submodel_dosen_hasil_evaluasi_saran.dart';

import '../../../data/repository/network_repository.dart';
import '../../../models/model_api.dart';
import '../../../utils/service/logger.dart';

class DosenHasilEvaluasiSaranSubState with ChangeNotifier, DiagnosticableTreeMixin {
  SubModelDosenHasilEvaluasiKuesionerSaran? data;
  Map<String, dynamic>? error;
  String errorMessage = '';
  String kelasId = '';
  bool isLoading = true;

  Future<void> initData(String kelasId) async {
    final res =
    await NetworkRepository().getDataHasilKuesionerDosenSaran(kelasId);
    if (res.code == CODE.SUCCESS) {
      data = SubModelDosenHasilEvaluasiKuesionerSaran.fromMap(res.data);
      UtilLogger.log('Data Hasil Kuesioner Saran', data!.toJson());
      isLoading = false;
      notifyListeners();
    } else if (res.code == CODE.ERROR){
      isLoading = false;
      error = res.message;
      notifyListeners();
    } else {
      isLoading = false;
      error = res.message;
      errorMessage = res.message;
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
