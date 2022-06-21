import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik_dosen/states/kuesioner/state_dosen_hasil_evaluasi_kuesioner.dart';

import '../../../../../../utils/color_pallete.dart';
import '../../../penawaran/component/empty_matakuliah.dart';
import 'hasil_evaluasi_dosen_list_tile.dart';


Widget ListHasilEvaluasiDosen(
    BuildContext context, DosenHasilEvaluasiKuesionerState state) {
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
          (e) => HasilEvaluasiDosenListTile(
        data: e,
      ),
    )
        .toList(),
  );
}
