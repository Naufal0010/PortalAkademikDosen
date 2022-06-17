import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_dosen_jadwal_uas.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/jadwal/jadwaluas/component/list_jadwal_uas.dart';

import '../../../../../states/jadwal/state_dosen_riwayat_semester.dart';
import '../../../../../states/state.dart';
import '../../../../../utils/widget/shimmer_list_tile.dart';
import '../../../../../utils/widget/shimmer_widget.dart';

class UASPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DosenRiwayatSemesterState userRiwayatSemester =
        Provider.of<DosenRiwayatSemesterState>(context, listen: true);

    DosenJadwalUasState user =
        Provider.of<DosenJadwalUasState>(context, listen: false);

    if (userRiwayatSemester.data != null) {
      user.initData(userRiwayatSemester.data!.data!.first.semId);
    }

    Future<void> refresh() {
      user.refreshData();
      userRiwayatSemester.refreshData();
      return userRiwayatSemester.refreshData();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Data Jadwal UAS',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userRiwayatSemester.isLoading
                ? ShimmerWidget(
                    width: 100,
                    height: 20,
                  )
                : Text(userRiwayatSemester.data!.data!.first.semNama),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: RefreshIndicator(
                  onRefresh: refresh,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Consumer<DosenJadwalUasState>(
                      builder: (context, value, child) {
                        return value.isLoading
                            ? ShimmerListTile()
                            : ListJadwalUas(context, value);
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
