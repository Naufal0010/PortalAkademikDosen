import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/models/penawaran/model_list_dosen_penawaran_mata_kuliah_dipilih.dart';

import '../../data/repository/network_repository.dart';
import '../../models/model_api.dart';
import '../../utils/service/logger.dart';

class DosenListPenawaranMataKuliahDipilihState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelListDosenPenawaranMataKuliah? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  Future<void> initData(String idKelas) async {
    final res = await NetworkRepository().getListDosenPenawaranMataKuliah(idKelas);
    if (res.code == CODE.SUCCESS) {
      data = ModelListDosenPenawaranMataKuliah.fromMap(res.data);
      UtilLogger.log('List dosen matakuliah dipilih', data!.toJson());
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
