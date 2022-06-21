import 'package:flutter/material.dart';

import '../../../../../../../../models/kuesioner/submodel/submodel_dosen_hasil_evaluasi_detail.dart';
import '../../../../../../../../utils/color_pallete.dart';

class KuesionerKepuasanDetailListTile extends StatelessWidget {
  final HasilKuesionerDetail data;
  final List<HasilKuesionerDetail>? dataKuesioner;

  KuesionerKepuasanDetailListTile(
      {required this.data, required this.dataKuesioner});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: ColorPallete.primary),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: ColorPallete.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(2)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '${data.soal}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: SizedBox(
                        width: 60,
                        child: Text(
                          'Sangat\nTidak Setuju',
                          style: TextStyle(fontSize: 10),
                        ),
                      )),
                      Expanded(
                          child: SizedBox(
                        width: 60,
                        child: Text('Tidak\nSetuju',
                            style: TextStyle(fontSize: 10)),
                      )),
                      Expanded(
                          child: SizedBox(
                        width: 60,
                        child: Text('Cukup\nSetuju',
                            style: TextStyle(fontSize: 10)),
                      )),
                      Expanded(
                          child: SizedBox(
                        width: 60,
                        child: Text('Setuju', style: TextStyle(fontSize: 10)),
                      )),
                      Expanded(
                          child: SizedBox(
                        width: 60,
                        child: Text('Sangat\nSetuju',
                            style: TextStyle(fontSize: 10)),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 60,
                        child: Text(
                          '${data.sangatTidakSetuju}',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: Text(
                          '${data.tidakSetuju}',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: Text(
                          '${data.cukupSetuju}',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: Text(
                          '${data.setuju}',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: Text(
                          '${data.sangatSetuju}',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Skala Likert(%)', style: TextStyle(fontSize: 12),),
                      Text(data.skalaLikert, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
