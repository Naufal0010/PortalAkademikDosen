import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/models/jadwal/model_dosen_semester_aktif.dart';
import 'package:portal_akademik_dosen/utils/api_local_store.dart';

import '../../data/repository/network_repository.dart';
import '../../models/model_api.dart';
import '../../utils/service/logger.dart';

class DosenSemesterAktifState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelDosenSemesterAktif? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  DosenSemesterAktifState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getSemesterAktif();
    if (res.code == CODE.SUCCESS) {
      data = ModelDosenSemesterAktif.fromMap(res.data);
      ApiLocalStorage.modelDosenSemesterAktif = data;
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Semester Aktif', data);
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
