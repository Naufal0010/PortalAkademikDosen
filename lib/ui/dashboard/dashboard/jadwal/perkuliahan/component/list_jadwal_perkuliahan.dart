import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_jadwal_perkuliahan_per_semester.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/jadwal/perkuliahan/component/perkuliahan_list_tile.dart';

import '../../../../../../utils/color_pallete.dart';

Widget ListJadwalPerkuliahanDosen(
    BuildContext context, DosenJadwalPerkuliahanPerSemesterState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return Center(
      child: ElevatedButton(
        onPressed: () {
          state.refreshData();
        },
        child: Center(child: Text('Refresh')),
        style: ElevatedButton.styleFrom(
            primary: ColorPallete.primary, onPrimary: Colors.white),
      ),
    );
  }

  if (state.data?.data?.isEmpty == true) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: Text(
              'Tidak ada Jadwal Kuliah'
          ),
        ),
      ),
    );
  }

  return Column(
    children: state.data!.data!
        .map(
          (e) => PerkuliahanListTile(e),
    ).toList(),
  );
}