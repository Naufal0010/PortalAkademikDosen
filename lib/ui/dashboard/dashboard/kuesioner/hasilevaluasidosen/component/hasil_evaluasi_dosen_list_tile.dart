import 'package:flutter/material.dart';

import '../../../../../../models/kuesioner/model_dosen_hasil_evaluasi_kuesioner.dart';
import '../../../../../../utils/color_pallete.dart';

class HasilEvaluasiDosenListTile extends StatelessWidget {
  final HasilEvaluasi data;

  HasilEvaluasiDosenListTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorPallete.primary),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: InkWell(
          onTap: () {
            // showFlexibleBottomSheet(
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.only(
            //             topRight: Radius.circular(10.0),
            //             topLeft: Radius.circular(10.0))),
            //     isExpand: false,
            //     initHeight: 0.7,
            //     maxHeight: 0.7,
            //     context: context,
            //     bottomSheetColor: Colors.transparent,
            //     builder: (context, controller, offset) {
            //       return BottmSheetPenawaranMataKuliah(
            //           data: data, controller: controller);
            //     });
          },
          splashColor: ColorPallete.primary,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.mkkurKode,
                      style: TextStyle(color: ColorPallete.primary),
                    ),
                    SizedBox(
                        width: 220,
                        child: Text(
                          data.mkkurNamaResmi,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Text(
                      'Kelas: ${data.klsNama}',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
