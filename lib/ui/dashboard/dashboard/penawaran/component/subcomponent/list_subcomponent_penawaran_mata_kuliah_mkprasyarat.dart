import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/penawaran/component/subcomponent/penawaran_matakuliah_list_tile_mkprasyarat.dart';

import '../../../../../../states/penawaran/state_dosen_list_mata_kuliah_dipilih.dart';

Widget ListMataKuliahDosenDipilihMkPrasyarat(
    BuildContext context, DosenListPenawaranMataKuliahDipilihState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  if (state.data?.data?.mkPrasyarat?.length == 0) {
    return Text('-');
  }

  return Column(
    children: state.data!.data!.mkPrasyarat!
        .map(
          (e) => PenawaranMataKuliahListTileMkPrasyarat(
            data: e,
          ),
        )
        .toList(),
  );
}
