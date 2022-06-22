import 'package:flutter/material.dart';

import '../../../../../../../../models/kuesioner/submodel/modelsaran/submodel_dosen_hasil_evaluasi_saran.dart';
import '../../../../../../../../utils/color_pallete.dart';

class DosenSaranDetailPage extends StatelessWidget {
  final DosenList data;
  final List<Map<String, dynamic>?>? dataSaran;

  DosenSaranDetailPage({required this.data, required this.dataSaran});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(data.dosen!.nama,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: dataSaran!
                .map((e) => Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: ColorPallete.primary),
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e!['${data.nip}'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
