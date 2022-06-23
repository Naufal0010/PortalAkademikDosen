import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/models/jadwal/model_dosen_perkuliahan_per_semester.dart';
import 'package:intl/intl.dart';

import '../../data/repository/network_repository.dart';
import '../../models/model_api.dart';
import '../../utils/service/logger.dart';

var now = DateTime.now();
var weekDay = DateFormat('EEEE');
String formatDate = weekDay.format(now);

class DosenJadwalPerkuliahanHariIniState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelJadwalPerkuliahanPerSemester? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  String weekDayToIndonesia(String weekDay) {
    String hari = '';

    switch(weekDay) {
      case 'Monday':
        hari = 'Senin';
        break;
      case 'Tuesday':
        hari = 'Selasa';
        break;
      case 'Wednesday':
        hari = 'Rabu';
        break;
      case 'Thursday':
        hari = 'Kamis';
        break;
      case 'Friday':
        hari = 'Jumat';
        break;
      default:
        hari = 'Hari Libur';
        break;
    }

    return hari;
  }

  Future<void> initData(String semester) async {
    final res = await NetworkRepository().getJadwalPerkuliahanPerSemester(
        semester);
    if (res.code == CODE.SUCCESS) {
      data = ModelJadwalPerkuliahanPerSemester.fromMap(res.data);
      data!.data = data!.data!.where((element) => element.hari == weekDayToIndonesia(formatDate)).toList();
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Perkuliahan Hari Ini', data?.toJson());
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
