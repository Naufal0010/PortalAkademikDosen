import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/penawaran/component/penawaran_matakuliah_list_tile.dart';

import '../../../../../states/penawaran/state_dosen_penawaran_mata_kuliah_dipilih.dart';
import '../../../../../utils/color_pallete.dart';
import 'empty_matakuliah.dart';

Widget ListMataKuliahPenawaran(
    BuildContext context, DosenPenawaranMataKuliahDipilihState state) {
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

  if (state.data?.data?.length == 0) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: EmptyMataKuliah());
  }

  return Column(
    children: state.data!.data!
        .map(
          (e) => PenawaranMataKuliahListTile(
            data: e,
          ),
        )
        .toList(),
  );
}
