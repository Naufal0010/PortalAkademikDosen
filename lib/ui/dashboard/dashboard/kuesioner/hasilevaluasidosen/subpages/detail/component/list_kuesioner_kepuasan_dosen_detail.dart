import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik_dosen/states/kuesioner/substates/substate_dosen_hasil_evaluasi_detail.dart';

import 'kuesioner_kepuasan_detail_list_tile.dart';


Widget ListKuesionerKepuasanDosenDetail(
    BuildContext context, DosenHasilEvaluasiSubState state) {

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


  if (state.data?.kuesioner?.length == null) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 600,
      child: Html(
        data: """
               ${state.errorMessage}
              """,
        style: {
          "body": Style(
            fontFamily: 'Poppins',
            textAlign: TextAlign.center,
            fontSize: FontSize(16.0),
          ),
        },
      ),
    );
  }

  return Column(
    children: [
      Column(
        children: state.data!.kuesioner!
            .map(
              (e) => KuesionerKepuasanDetailListTile(
                data: e,
                dataKuesioner: state.data?.kuesioner,
              ),
            )
            .toList(),
      ),
    ],
  );
}
