import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/dashboard_page.dart';
import 'package:portal_akademik_dosen/utils/color_pallete.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/dashboard_page.dart';

import '../../../states/state.dart';
import '../../../states/state_auth.dart';

class DrawerNavigator extends StatefulWidget {
  const DrawerNavigator({Key? key}) : super(key: key);

  @override
  State<DrawerNavigator> createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  @override
  Widget build(BuildContext context) {
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
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Rudy Herteno',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Text(
                        '19880925201703110001',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
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
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
      case 9:
        break;
      case 10:
        break;
      case 11:
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
