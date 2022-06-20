import 'package:flutter/foundation.dart';

import '../../data/repository/network_repository.dart';
import '../../models/model_api.dart';
import '../../models/penawaran/model_penawaran_mk_dipilih.dart';
import '../../utils/service/logger.dart';

class DosenPenawaranMataKuliahDipilihState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelPenawaranMataKuliahDipilih? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  Future<void> initData(String paketTawar) async {
    final res = await NetworkRepository().getDosenPenawaranMataKuliah(paketTawar);
    if (res.code == CODE.SUCCESS) {
      data = ModelPenawaranMataKuliahDipilih.fromMap(res.data);
      UtilLogger.log('Paket Semester di pilih', data!.toJson());
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
