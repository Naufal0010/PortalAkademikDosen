import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/penawaran/component/penawaran_matakuliah_bottomsheet.dart';

import '../../../../../models/penawaran/model_penawaran_mk_dipilih.dart';
import '../../../../../utils/color_pallete.dart';

class PenawaranMataKuliahListTile extends StatelessWidget {
  final TawarMataKuliah data;

  PenawaranMataKuliahListTile({required this.data});

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
            showFlexibleBottomSheet(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0))),
                isExpand: false,
                initHeight: 0.7,
                maxHeight: 0.7,
                context: context,
                bottomSheetColor: Colors.transparent,
                builder: (context, controller, offset) {
                  return BottmSheetPenawaranMataKuliah(
                      data: data, controller: controller);
                });
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
                      data.kodeMk,
                      style: TextStyle(color: ColorPallete.primary),
                    ),
                    SizedBox(
                        width: 220,
                        child: Text(
                          data.mk,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Text(
                      '${data.sksTotal} SKS',
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