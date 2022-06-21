import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/kuesioner/substates/substate_dosen_hasil_evaluasi_detail.dart';
import 'package:portal_akademik_dosen/utils/color_pallete.dart';

import '../../../../../../../models/kuesioner/model_dosen_hasil_evaluasi_kuesioner.dart';
import '../../../../../../../states/state.dart';
import '../../../../../../../utils/widget/shimmer_list_tile.dart';
import 'component/list_kuesioner_kepuasan_dosen_detail.dart';

class HasilEvaluasiDosenDetail extends StatelessWidget {
  final HasilEvaluasi data;

  HasilEvaluasiDosenDetail({required this.data});

  @override
  Widget build(BuildContext context) {

    DosenHasilEvaluasiSubState user =
    Provider.of<DosenHasilEvaluasiSubState>(context, listen: false);
    
    user.initData(data.klsId);

    Future<void> refresh() {
      user.refreshData();
      user.initData(data.klsId);
      return user.refreshData();
    }
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text('Detail ${data.mkkurNamaResmi}',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                children: [
                  Consumer<DosenHasilEvaluasiSubState>(
                    builder: (context, value, child) {
                      return value.isLoading
                          ? ShimmerListTile()
                          : Column(
                            children: [
                              ListKuesionerKepuasanDosenDetail(context, user),
                              SizedBox(height: 8),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorPallete.primary),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('TOTAL', style: TextStyle(fontWeight: FontWeight.bold)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Sangat Tidak Setuju'),
                                          Text('${user.data!.sangatTidakSetuju}')
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Tidak Setuju'),
                                          Text('${user.data!.tidakSetuju}')
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Cukup Setuju'),
                                          Text('${user.data!.cukupSetuju}')
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Setuju'),
                                          Text('${user.data!.setuju}')
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Sangat Setuju'),
                                          Text('${user.data!.sangatSetuju}')
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Skala Likert (%)'),
                                          Text(user.data!.skalaLikert, style: TextStyle(fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
