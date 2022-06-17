import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/models/jadwal/model_dosen_perkuliahan_per_semester.dart';

import '../../data/repository/network_repository.dart';
import '../../models/model_api.dart';
import '../../utils/service/logger.dart';

class DosenJadwalPerkuliahanPerSemesterState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelJadwalPerkuliahanPerSemester? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  Future<void> initData(String semester) async {
    final res = await NetworkRepository().getJadwalPerkuliahanPerSemester(
        semester);
    if (res.code == CODE.SUCCESS) {
      data = ModelJadwalPerkuliahanPerSemester.fromMap(res.data);
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Perkuliahan Per Semester', data?.toJson());
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
