import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_dosen_jadwal_penting.dart';

import '../../../../../states/state.dart';
import '../../../../../utils/widget/shimmer_widget.dart';
import 'component/jadwal_penting_list_table.dart';

class JadwalPentingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DosenJadwalPentingState jadwalPenting =
    Provider.of<DosenJadwalPentingState>(context, listen: true);

    Future<void> onRefresh() {
      return jadwalPenting.refreshData();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Jadwal Penting',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: jadwalPenting.isLoading
                ? ShimmerWidget(width: MediaQuery.of(context).size.width, height: 40,)
                : JadwalPentingListTable(),
          ),
        ),
      ),
    );
  }
}
