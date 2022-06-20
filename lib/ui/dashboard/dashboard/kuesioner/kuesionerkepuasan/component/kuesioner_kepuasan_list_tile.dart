import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:portal_akademik_dosen/models/kuesioner/model_dosen_kuesioner_kepuasan.dart';

import '../../../../../../../../states/state.dart';
import '../../../../../../states/kuesioner/state_dosen_kuesioner_kepuasan.dart';
import '../../../../../../utils/color_pallete.dart';

class KuesionerKepuasanListTile extends StatelessWidget {
  final DataKuesioner data;
  final List<DataKuesioner>? dataKuesioner;

  KuesionerKepuasanListTile({required this.data, required this.dataKuesioner});

  @override
  Widget build(BuildContext context) {
    double _currentRating = 0;

    DosenKuesionerKepuasanState user =
        Provider.of<DosenKuesionerKepuasanState>(context, listen: false);

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
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 20,
                      child: RatingBar.builder(
                        itemSize: 18.0,
                        initialRating: _currentRating,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 25.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          _currentRating = rating;
                          user.simpanDataKuesionerKepuasanDosen(
                              data.idSoal, rating.toString());
                          print(rating);
                          print(_currentRating);
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
