import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/utils/service/logger.dart';

import '../../data/repository/network_repository.dart';
import '../../models/model_api.dart';
import '../../models/perwalian/model_dosen_perwalian_mahasiswa.dart';
import '../../utils/api_local_store.dart';

class DosenPerwalianMahasiswaState
    with ChangeNotifier, DiagnosticableTreeMixin {
  ModelDosenPerwalianMahasiswa? data;
  Map<String, dynamic>? error;
  String errorMessage = '';
  bool isLoading = true;

  DosenPerwalianMahasiswaState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getPerwalianMahasiswa(
        ApiLocalStorage.modelDosenSemesterAktif!.semesterAktif!.kode);
    if (res.code == CODE.SUCCESS) {
      data = ModelDosenPerwalianMahasiswa.fromMap(res.data);
      UtilLogger.log('Perwalian', data!.toJson());
      isLoading = false;
      notifyListeners();
    } else if (res.code == CODE.ERROR) {
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
    initData();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
