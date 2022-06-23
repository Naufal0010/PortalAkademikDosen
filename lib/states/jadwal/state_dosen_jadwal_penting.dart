import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../data/repository/network_repository.dart';
import '../../models/jadwal/model_dosen_jadwal_penting.dart';
import '../../models/model_api.dart';
import '../../ui/dashboard/dashboard/jadwal/jadwalpenting/component/jadwal_penting_list_table.dart';
import '../../utils/color_pallete.dart';

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

  Future<void> initDataFirst(BuildContext context) async {
    await initData();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Pengumuman',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          content: JadwalPentingListTable(),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK', style: TextStyle(color: ColorPallete.primary),))
          ],
        ));
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
