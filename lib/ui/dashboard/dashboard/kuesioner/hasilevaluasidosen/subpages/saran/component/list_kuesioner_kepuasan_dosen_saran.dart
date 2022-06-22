import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:portal_akademik_dosen/states/kuesioner/substates/substate_dosen_hasil_evaluasi_saran.dart';

import '../subpages/dosen_saran_detail_page.dart';
import 'kuesioner_kepuasan_saran_list_tile.dart';

Widget ListKuesionerKepuasanDosenSaran(
    BuildContext context, DosenHasilEvaluasiSaranSubState state) {

  if (state.data?.dosen?.length == null) {
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
        children: state.data!.dosen!
            .map(
              (e) => KuesionerKepuasanSaranListTile(
                data: e.dosen!,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DosenSaranDetailPage(
                          data: e, dataSaran: state.data!.saran)));
                },
              ),
            )
            .toList(),
      ),
    ],
  );
}
