import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_dosen_jadwal_penting.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_dosen_jadwal_uas.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_dosen_riwayat_semester.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_dosen_semester_aktif.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_jadwal_perkuliahan_hari_ini.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_jadwal_perkuliahan_per_semester.dart';
import 'package:portal_akademik_dosen/states/kuesioner/state_dosen_hasil_evaluasi_kuesioner.dart';
import 'package:portal_akademik_dosen/states/kuesioner/state_dosen_kuesioner_kepuasan.dart';
import 'package:portal_akademik_dosen/states/kuesioner/state_dosen_semester_ampu.dart';
import 'package:portal_akademik_dosen/states/kuesioner/substates/substate_dosen_hasil_evaluasi_detail.dart';
import 'package:portal_akademik_dosen/states/kuesioner/substates/substate_dosen_hasil_evaluasi_saran.dart';
import 'package:portal_akademik_dosen/states/penawaran/state_dosen_list_mata_kuliah_dipilih.dart';
import 'package:portal_akademik_dosen/states/penawaran/state_dosen_penawaran_mata_kuliah.dart';
import 'package:portal_akademik_dosen/states/penawaran/state_dosen_penawaran_mata_kuliah_dipilih.dart';
import 'package:portal_akademik_dosen/states/perwalian/state_dosen_perwalian_mahasiswa.dart';
import 'package:portal_akademik_dosen/states/profil/state_dosen_profil.dart';
import 'package:portal_akademik_dosen/states/state.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/dashboard_page.dart';
import 'package:portal_akademik_dosen/ui/login/login_page.dart';

class App extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthState()),
        ChangeNotifierProvider(create: (_) => DosenProfilState()),
        ChangeNotifierProvider(create: (_) => DosenJadwalPentingState()),
        ChangeNotifierProvider(create: (_) => DosenRiwayatSemesterState()),
        ChangeNotifierProvider(create: (_) => DosenJadwalPerkuliahanPerSemesterState()),
        ChangeNotifierProvider(create: (_) => DosenJadwalUasState()),
        ChangeNotifierProvider(create: (_) => DosenPenawaranMataKuliahState()),
        ChangeNotifierProvider(create: (_) => DosenPenawaranMataKuliahDipilihState()),
        ChangeNotifierProvider(create: (_) => DosenListPenawaranMataKuliahDipilihState()),
        ChangeNotifierProvider(create: (_) => DosenKuesionerKepuasanState()),
        ChangeNotifierProvider(create: (_) => DosenSemesterAmpuState()),
        ChangeNotifierProvider(create: (_) => DosenHasilEvaluasiKuesionerState()),
        ChangeNotifierProvider(create: (_) => DosenHasilEvaluasiSubState()),
        ChangeNotifierProvider(create: (_) => DosenHasilEvaluasiSaranSubState()),
        ChangeNotifierProvider(create: (_) => DosenSemesterAktifState()),
        ChangeNotifierProvider(create: (_) => DosenJadwalPerkuliahanHariIniState()),
        ChangeNotifierProvider(create: (_) => DosenPerwalianMahasiswaState()),

      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          home: WillPopScope(
            child: Consumer<AuthState>(
              builder: (context, percentDone, child) {
                return context.watch<AuthState>().isLogged
                    ? const DashboardPage()
                    : const LoginPage();
              },
            ),
            onWillPop: onWillPop,
          ),
          title: 'Portal Akademik Dosen',
          theme: ThemeData(fontFamily: 'Poppins'),
        ),
      ),
    );
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }
}
