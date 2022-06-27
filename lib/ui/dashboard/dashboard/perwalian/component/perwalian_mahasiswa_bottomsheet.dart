import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/utils/color_pallete.dart';

import '../../../../../models/perwalian/model_dosen_perwalian_mahasiswa.dart';


class BottomSheetPerwalianMahasiswa extends StatelessWidget {
  final MahasiswaPerwalian data;
  final ScrollController controller;

  BottomSheetPerwalianMahasiswa({required this.data, required this.controller});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        controller: controller,
        shrinkWrap: true,
        children: [
          Text(
            '${data.nim}',
            style: TextStyle(fontSize: 12, color: ColorPallete.primary),
          ),
          Text(
            data.nama!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Angkatan',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          Text(
            '${data.angkatan}',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => HasilEvaluasiDosenDetail(data: data,)));
              },
              child: Text(
                'Hasil Studi',
                style: TextStyle(fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                  onPrimary: Colors.white),
            ),
          ),
          SizedBox(height: 8,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => HasilEvaluasiDosenSaran(data: data)));
              },
              child: Text(
                'Transkrip Nilai',
                style: TextStyle(fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                  primary: ColorPallete.primary,
                  onPrimary: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
