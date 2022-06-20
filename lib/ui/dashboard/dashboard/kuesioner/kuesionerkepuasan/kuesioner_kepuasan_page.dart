import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/kuesioner/state_dosen_kuesioner_kepuasan.dart';
import 'package:portal_akademik_dosen/utils/api_local_store.dart';

import '../../../../../states/state.dart';
import '../../../../../utils/widget/shimmer_list_tile.dart';
import 'component/list_kuesioner_kepuasan_dosen.dart';

class KuesionerKepuasanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DosenKuesionerKepuasanState user =
        Provider.of<DosenKuesionerKepuasanState>(context, listen: false);

    user.initData(ApiLocalStorage.modelProfilDosen!.nip);

    Future<void> refresh() {
      user.refreshData();
      user.initData(ApiLocalStorage.modelProfilDosen!.nip);
      return user.refreshData();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Kuesioner Kepuasan',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
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
                  Consumer<DosenKuesionerKepuasanState>(
                    builder: (context, value, child) {
                      return value.isLoading
                          ? ShimmerListTile()
                          : ListKuesionerKepuasanDosen(context, user);
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
