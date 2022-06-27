import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/perwalian/component/empty_perwalian_mahasiswa.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/perwalian/component/perwalian_mahasiswa_list_tile.dart';

import '../../../../../states/perwalian/state_dosen_perwalian_mahasiswa.dart';
import '../../../../../utils/color_pallete.dart';

Widget ListPerwalianMahasiswa(
    BuildContext context, DosenPerwalianMahasiswaState state) {
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

  if (state.data!.data == null) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: EmptyPerwalianMahasiswa());
  }

  return Column(
    children: state.data!.data!.rows!
        .map(
          (e) => PerwalianMahasiswaListTile(
            data: e.mahasiswa!,
          ),
        )
        .toList(),
  );
}
