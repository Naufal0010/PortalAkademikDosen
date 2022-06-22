import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/kuesioner/substates/substate_dosen_hasil_evaluasi_saran.dart';

import '../../../../../../../models/kuesioner/model_dosen_hasil_evaluasi_kuesioner.dart';
import '../../../../../../../states/state.dart';
import '../../../../../../../utils/widget/shimmer_list_tile.dart';
import 'component/list_kuesioner_kepuasan_dosen_saran.dart';

class HasilEvaluasiDosenSaran extends StatelessWidget {
  final HasilEvaluasi data;

  HasilEvaluasiDosenSaran({required this.data});

  @override
  Widget build(BuildContext context) {

    DosenHasilEvaluasiSaranSubState user =
    Provider.of<DosenHasilEvaluasiSaranSubState>(context, listen: false);

    user.refreshData();
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
        title: const Text('Saran',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                children: [
                  Consumer<DosenHasilEvaluasiSaranSubState>(
                    builder: (context, value, child) {
                      return value.isLoading
                          ? ShimmerListTile()
                          : ListKuesionerKepuasanDosenSaran(context, user);
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
