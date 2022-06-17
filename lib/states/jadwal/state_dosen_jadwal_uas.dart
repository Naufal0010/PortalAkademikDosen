import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/models/jadwal/model_dosen_jadwal_uas.dart';

import '../../data/repository/network_repository.dart';
import '../../models/model_api.dart';
import '../../utils/service/logger.dart';

class DosenJadwalUasState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelJadwalUasDosen? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  Future<void> initData(String semester) async {
    final res = await NetworkRepository().getJadwalUas(semester);
    if (res.code == CODE.SUCCESS) {
      data = ModelJadwalUasDosen.fromMap(res.data);
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Jadwal Uas', data?.toJson());
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
