import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/utils/color_pallete.dart';

import '../../../../../../models/kuesioner/model_dosen_hasil_evaluasi_kuesioner.dart';

class BottomSheetHasilEvaluasiDosen extends StatelessWidget {
  final HasilEvaluasi data;
  final ScrollController controller;

  BottomSheetHasilEvaluasiDosen({required this.data, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        controller: controller,
        shrinkWrap: true,
        children: [
          Text(
            '${data.mkkurKode}',
            style: TextStyle(
                fontSize: 12,
                color: ColorPallete.primary,
                fontWeight: FontWeight.bold),
          ),
          Text(
            data.mkkurNamaResmi,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          Text(
            'kelas ${data.klsNama}',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            'Prodi ${data.prodiNamaResmi}',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'SKS',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          Text(
            '${data.sks} SKS',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Jumlah Penilaian',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          Row(
            children: [
              Text(
                'Baik: ',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                '${data.baik}',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Kurang: ',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                '${data.kurang}',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
