import 'package:flutter/foundation.dart';

import '../../data/repository/network_repository.dart';
import '../../models/jadwal/model_dosen_jadwal_penting.dart';
import '../../models/model_api.dart';

class DosenJadwalPentingState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelDosenJadwalPenting? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  DosenJadwalPentingState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getJadwalPentingDosen();
    if (res.code == CODE.SUCCESS) {
      data = ModelDosenJadwalPenting.fromMap(res.data);
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
    initData();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
