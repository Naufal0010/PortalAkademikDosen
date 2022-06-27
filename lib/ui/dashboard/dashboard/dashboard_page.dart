import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_dosen_jadwal_penting.dart';
import 'package:portal_akademik_dosen/states/profil/state_dosen_profil.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/component/handler/exception_handle_dashboard.dart';
import 'package:portal_akademik_dosen/ui/dashboard/drawer/drawer_navigator.dart';
import 'package:portal_akademik_dosen/utils/color_pallete.dart';
import 'package:portal_akademik_dosen/utils/widget/shimmer_widget.dart';

import '../../../states/jadwal/state_dosen_riwayat_semester.dart';
import '../../../states/jadwal/state_dosen_semester_aktif.dart';
import '../../../states/jadwal/state_jadwal_perkuliahan_hari_ini.dart';
import '../../../states/state.dart';
import 'component/carousel/list_carousel_jadwal_hari_ini.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    super.initState();
    DosenJadwalPentingState dosenJadwal =
    Provider.of<DosenJadwalPentingState>(context, listen: false);
    dosenJadwal.initDataFirst(context);

  }

  @override
  Widget build(BuildContext context) {
    DosenProfilState user =
        Provider.of<DosenProfilState>(context, listen: true);

    DosenRiwayatSemesterState userRiwayatSemester =
        Provider.of<DosenRiwayatSemesterState>(context, listen: true);

    DosenSemesterAktifState semesterAktif =
        Provider.of<DosenSemesterAktifState>(context, listen: true);

    DosenJadwalPerkuliahanHariIniState jadwal =
        Provider.of<DosenJadwalPerkuliahanHariIniState>(context, listen: false);

    Future<void> refresh() {
      user.refreshData();
      semesterAktif.refreshData();
      userRiwayatSemester.refreshData();
      jadwal.refreshData();
      semesterAktif.isLoading
          ? null
          : jadwal.initData(semesterAktif.data!.semesterAktif!.kode);
      return user.refreshData();
    }

    semesterAktif.isLoading
        ? ''
        : jadwal.initData(semesterAktif.data!.semesterAktif!.kode);

    return Scaffold(
      drawer: const DrawerNavigator(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Beranda',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(width: 1, color: ColorPallete.primary),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Container(
                                  padding: const EdgeInsets.all(2.0),
                                  child: user.isLoading
                                      ? ShimmerWidget(
                                          height: 20,
                                          width: 100,
                                        )
                                      : getNameDosen(context, user)),
                              Container(
                                  padding: const EdgeInsets.all(4.0),
                                  child: user.isLoading
                                      ? ShimmerWidget(
                                          height: 20,
                                          width: 100,
                                        )
                                      : getNipDosen(context, user)),
                            ],
                          ),
                          user.isLoading
                              ? ShimmerWidget(
                                  borderRadius: BorderRadius.circular(80.0),
                                  height: 50,
                                  width: 50,
                                )
                              : getPhotoDosen(context, user),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Jabatan',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: user.isLoading
                                        ? ShimmerWidget(
                                            width: 100,
                                            height: 20,
                                          )
                                        : getJabatanDosen(context, user)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Fakultas',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: user.isLoading
                                        ? ShimmerWidget(
                                            width: 100,
                                            height: 20,
                                          )
                                        : getFakultasDosen(context, user)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Program Studi',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: user.isLoading
                                        ? ShimmerWidget(
                                            width: 100,
                                            height: 20,
                                          )
                                        : getProgramStudiDosen(context, user)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Jadwal Hari Ini',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Consumer<DosenJadwalPerkuliahanHariIniState>(
                  builder: (context, value, child) {
                    return semesterAktif.isLoading
                        ? ShimmerWidget(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                          )
                        : ListCarouselJadwalHariIni(context, jadwal);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
