import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/models/jadwal/model_dosen_riwayat_semester.dart';

import '../../data/repository/network_repository.dart';
import '../../models/model_api.dart';
import '../../utils/service/logger.dart';

class DosenRiwayatSemesterState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelRiwayatSemesterDosen? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  DosenRiwayatSemesterState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getRiwayatSemesterDosen();
    if (res.code == CODE.SUCCESS) {
      data = ModelRiwayatSemesterDosen.fromMap(res.data);
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Riwayat Semester', data);
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
