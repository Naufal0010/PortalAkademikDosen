import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/models/kuesioner/model_dosen_semester_ampu.dart';

import '../../data/repository/network_repository.dart';
import '../../models/model_api.dart';
import '../../utils/service/logger.dart';

class DosenSemesterAmpuState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelDosenSemesterAmpu? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  DosenSemesterAmpuState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getSemesterDosenAmpu();
    if (res.code == CODE.SUCCESS) {
      data = ModelDosenSemesterAmpu.fromMap(res.data);
      UtilLogger.log('Semester Ampu', data!.toJson());
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
