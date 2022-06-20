import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../../../models/penawaran/model_list_dosen_penawaran_mata_kuliah_dipilih.dart';

class PenawaranMataKuliahListTileMkPrasyarat extends StatelessWidget {
  final MkPrasyarat data;

  PenawaranMataKuliahListTileMkPrasyarat({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Html(
            data: """
                  ${data.syarat}\n ${data.nama}
                   """,
            style: {
              "body": Style(
                color: Colors.black,
                lineHeight: LineHeight(1.5),

                textOverflow: TextOverflow.ellipsis,
                margin: EdgeInsets.symmetric(horizontal: -10),
                fontFamily: 'Poppins',
                fontSize: FontSize(12.0),
              ),
            },
          ),
          SizedBox(height: 6,),
        ],
      ),
    );
  }
}
