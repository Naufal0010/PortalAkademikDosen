import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/models/penawaran/model_penawaran_mk_dipilih.dart';
import 'package:portal_akademik_dosen/utils/color_pallete.dart';

class BottmSheetPenawaranMataKuliah extends StatelessWidget {
  final TawarMataKuliah data;
  final ScrollController controller;

  BottmSheetPenawaranMataKuliah({required this.data, required this.controller});

  @override
  Widget build(BuildContext context) {
    Widget isJenisKuliah(String jenisKuliah) {
      if (jenisKuliah == 'P') {
        return Text(
          'Mata kuliah Peminatan',
          style: TextStyle(fontSize: 12),
        );
      }
      return Text(
        'Mata kuliah Wajib',
        style: TextStyle(fontSize: 12),
      );
    }

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        controller: controller,
        shrinkWrap: true,
        children: [
          Text(
            '${data.kodeMk}',
            style: TextStyle(fontSize: 12, color: ColorPallete.primary),
          ),
          Text(
            data.mk,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          Text(
            'kelas ${data.kls}',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            'Prodi ${data.prodi}',
            style: TextStyle(fontSize: 12),
          ),
          isJenisKuliah(data.w),
          SizedBox(
            height: 10,
          ),
          Text(
            'Semester',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          Text(
            'Semester ${data.semester}',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            'SKS',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          Text(
            '${data.sksTotal} SKS',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
