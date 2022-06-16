import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/models/profil/model_profil_dosen.dart';

import '../../data/repository/network_repository.dart';
import '../../models/model_api.dart';

class DosenProfilState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelProfilDosen? data;
  Map<String, dynamic>? error;
  String errorMessage = '';
  bool isLoading = true;

  DosenProfilState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getUser();
    if (res.code == CODE.SUCCESS) {
      data = ModelProfilDosen.fromMap(res.data);
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
