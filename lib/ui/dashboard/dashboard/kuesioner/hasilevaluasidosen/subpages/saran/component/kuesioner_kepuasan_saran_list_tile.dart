import 'package:flutter/material.dart';

import '../../../../../../../../models/kuesioner/submodel/modelsaran/submodel_dosen_hasil_evaluasi_saran.dart';
import '../../../../../../../../utils/color_pallete.dart';

class KuesionerKepuasanSaranListTile extends StatelessWidget {
  final DosenKuesioner data;
  final Function() onTap;

  KuesionerKepuasanSaranListTile({required this.data, required this.onTap});

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
          onTap: onTap,
          splashColor: ColorPallete.primary,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 220,
                  child: Text(
                    data.nama,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
