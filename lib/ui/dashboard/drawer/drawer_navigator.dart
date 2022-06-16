import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/dashboard_page.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/jadwal/kalender_akademik_page.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/jadwal/perkuliahan_page.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/jadwal/ujian_akhir_semester_page.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/kuesioner/hasil_evaluasi_page.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/kuesioner/kuesioner_kepuasan_page.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/penawaran/penawaranMK_page.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/penilaian/riwayat_page.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/penilaian/semester_berjalan_page.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/perwalian/perwalian_page.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/presensi/presensi_page.dart';
import 'package:portal_akademik_dosen/ui/dashboard/drawer/component/exception_handle_drawer.dart';
import 'package:portal_akademik_dosen/utils/color_pallete.dart';
import 'package:portal_akademik_dosen/utils/widget/shimmer_widget.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../../states/profil/state_dosen_profil.dart';
import '../../../states/state.dart';
import '../../../states/state_auth.dart';
import '../dashboard/jadwal/jadwalpenting/jadwal_penting_page.dart';

class DrawerNavigator extends StatefulWidget {
  const DrawerNavigator({Key? key}) : super(key: key);

  @override
  State<DrawerNavigator> createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  @override
  Widget build(BuildContext context) {
    DosenProfilState user =
        Provider.of<DosenProfilState>(context, listen: true);

    return Drawer(
      child: Material(
        color: ColorPallete.primary,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getPhotoDosenDrawer(context, user),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      user.isLoading
                          ? ShimmerWidget(
                              width: 100,
                              height: 10,
                            )
                          : getNameDosenDrawer(context, user),
                      user.isLoading
                          ? ShimmerWidget(
                              width: 100,
                              height: 10,
                            )
                          : getNipDosenDrawer(context, user),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Menu Akademik',
              style: TextStyle(color: Colors.white60, fontSize: 16),
            ),
            buildMenuItem(
                text: 'Beranda',
                icon: Icons.home,
                onClicked: () => selectedItem(context, 0)),
            buildMenuItem(
                text: 'Perwalian',
                icon: Icons.school,
                onClicked: () => selectedItem(context, 1)),
            ExpansionTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Penilaian',
                style: TextStyle(color: Colors.white),
              ),
              collapsedIconColor: Colors.white,
              children: [
                buildMenuItem(
                    text: 'Semester Berjalan',
                    icon: Icons.circle,
                    onClicked: () => selectedItem(context, 2)),
                buildMenuItem(
                    text: 'Riwayat',
                    icon: Icons.circle,
                    onClicked: () => selectedItem(context, 3)),
              ],
            ),
            buildMenuItem(
                text: 'Presensi',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 4)),
            const SizedBox(height: 24),
            const Text(
              'Menu Perkuliahan',
              style: TextStyle(color: Colors.white60, fontSize: 16),
            ),
            buildMenuItem(
                text: 'Penawaran Mata Kuliah',
                icon: Icons.list,
                onClicked: () => selectedItem(context, 5)),
            ExpansionTile(
              leading: const Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              title: const Text(
                'Jadwal',
                style: TextStyle(color: Colors.white),
              ),
              collapsedIconColor: Colors.white,
              children: [
                buildMenuItem(
                    text: 'Kalender Akademik',
                    icon: Icons.circle,
                    onClicked: () => selectedItem(context, 6)),
                buildMenuItem(
                    text: 'Jadwal Penting',
                    icon: Icons.circle,
                    onClicked: () => selectedItem(context, 7)),
                buildMenuItem(
                    text: 'Perkuliahan',
                    icon: Icons.circle,
                    onClicked: () => selectedItem(context, 8)),
                buildMenuItem(
                    text: 'Ujian Akhir Semester',
                    icon: Icons.circle,
                    onClicked: () => selectedItem(context, 9)),
              ],
            ),
            ExpansionTile(
              leading: const Icon(
                Icons.question_mark,
                color: Colors.white,
              ),
              title: const Text(
                'Kuesioner',
                style: TextStyle(color: Colors.white),
              ),
              collapsedIconColor: Colors.white,
              children: [
                buildMenuItem(
                    text: 'Kuesioner Kepuasan',
                    icon: Icons.circle,
                    onClicked: () => selectedItem(context, 10)),
                buildMenuItem(
                    text: 'Hasil Evaluasi Dosen',
                    icon: Icons.circle,
                    onClicked: () => selectedItem(context, 11)),
              ],
            ),
            const Divider(
              color: Colors.white70,
            ),
            buildMenuItem(
                text: 'Log Out',
                icon: Icons.logout,
                onClicked: () => selectedItem(context, 12))
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: const TextStyle(color: color),
        overflow: TextOverflow.ellipsis,
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    AuthState authState = Provider.of<AuthState>(context, listen: false);

    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context, barrierDimisable: true);

    void logout() async {
      _dialog.show(
          message: 'Loading...',
          type: SimpleFontelicoProgressDialogType.normal,
          indicatorColor: ColorPallete.primary);
      await Future.delayed(const Duration(seconds: 1));
      authState.logout();
      Navigator.of(context).pop();
      _dialog.hide();
    }

    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PerwalianPage()),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SemesterBerjalanPage()),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => RiwayatPage()),
        );
        break;
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PresensiPage()),
        );
        break;
      case 5:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PenawaranMKPage()),
        );
        break;
      case 6:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => KalenderAkademikPage()),
        );
        break;
      case 7:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => JadwalPentingPage()),
        );
        break;
      case 8:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PerkuliahanPage()),
        );
        break;
      case 9:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => UASPage()),
        );
        break;
      case 10:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => KuesionerKepuasanPage()),
        );
        break;
      case 11:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HasilEvaluasiPage()),
        );
        break;
      case 12:
        showAnimatedDialog(
            context: context,
            builder: (BuildContext context) {
              return ClassicGeneralDialogWidget(
                titleText: 'Keluar',
                contentText: 'Ingin keluar dari akun portal akademik dosen?',
                negativeText: 'Tidak',
                positiveText: 'Ya',
                positiveTextStyle: TextStyle(color: ColorPallete.primary),
                onPositiveClick: () {
                  logout();
                },
                onNegativeClick: () {
                  Navigator.of(context).pop();
                },
              );
            });
        break;
    }
  }
}
