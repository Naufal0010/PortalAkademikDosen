import 'package:flutter/material.dart';

import '../../../../../../models/jadwal/model_dosen_perkuliahan_per_semester.dart';
import '../../../../../../utils/color_pallete.dart';
import '../../../../../../utils/service/logger.dart';

class CarouselJadwalHarIni extends StatelessWidget {
  final JadwalPerkuliahan data;

  CarouselJadwalHarIni(this.data);

  @override
  Widget build(BuildContext context) {
    String text = data.jam;
    var waktuKuliah = '';

    if (data.jam != "") {
      waktuKuliah = text.substring(0, 5);
    }

    UtilLogger.log('jadwal', data);
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xffFF9F43),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Text(
                waktuKuliah,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: ColorPallete.primary),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    data.mk,
                    maxLines: 2,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorPallete.primary,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(
                      width: 170,
                      child: Text(
                        data.ruang,
                        maxLines: 2,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    'Prodi: ${data.namaProdi}',
                    maxLines: 2,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    '${data.sks} SKS',
                    maxLines: 2,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    '${data.hari}, ${data.jam}',
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
