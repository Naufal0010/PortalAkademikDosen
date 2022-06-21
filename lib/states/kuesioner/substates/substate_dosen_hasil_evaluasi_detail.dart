import 'package:flutter/foundation.dart';

import '../../../data/repository/network_repository.dart';
import '../../../models/kuesioner/submodel/submodel_dosen_hasil_evaluasi_detail.dart';
import '../../../models/model_api.dart';
import '../../../utils/service/logger.dart';

class DosenHasilEvaluasiSubState with ChangeNotifier, DiagnosticableTreeMixin {
  SubModelDosenHasilEvaluasiKuesioner? data;
  Map<String, dynamic>? error;
  String errorMessage = '';
  bool isLoading = true;

  Future<void> initData(String kelasId) async {
    final res =
        await NetworkRepository().getDataHasilKuesionerDosenDetail(kelasId);
    if (res.code == CODE.SUCCESS) {
      data = SubModelDosenHasilEvaluasiKuesioner.fromMap(res.data);
      UtilLogger.log('Data Hasil Kuesioner Detail', data!.toJson());
      isLoading = false;
      notifyListeners();
    } else if (res.code == CODE.ERROR){
      isLoading = false;
      error = res.message;
      notifyListeners();
    } else {
      isLoading = false;
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
