import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_dosen_riwayat_semester.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_jadwal_perkuliahan_per_semester.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../../../../models/jadwal/model_dosen_riwayat_semester.dart';
import '../../../../../states/state.dart';
import '../../../../../utils/color_pallete.dart';
import '../../../../../utils/widget/shimmer_list_tile.dart';
import '../../../../../utils/widget/shimmer_widget.dart';
import 'component/list_jadwal_perkuliahan.dart';

class PerkuliahanPage extends StatefulWidget {
  @override
  State<PerkuliahanPage> createState() => _PerkuliahanPageState();
}

class _PerkuliahanPageState extends State<PerkuliahanPage> {
  String _valSemester = "0";

  @override
  Widget build(BuildContext context) {
    DosenRiwayatSemesterState user =
        Provider.of<DosenRiwayatSemesterState>(context, listen: true);

    DosenJadwalPerkuliahanPerSemesterState userPaketSemester =
        Provider.of<DosenJadwalPerkuliahanPerSemesterState>(context,
            listen: false);

    if (user.data?.data?.first.semId != "0") {
      user.data?.data?.insert(
          0,
          RiwayatSemester(
              semId: "0",
              semTahun: "0",
              semNama: "Pilih Semester",
              semAktif: "0",
              kode: '0'));
    }

    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context, barrierDimisable: true);

    void initDataPaketSemester(Object? value) async {
      _dialog.show(
          message: 'Loading...',
          type: SimpleFontelicoProgressDialogType.normal,
          indicatorColor: ColorPallete.primary);
      await Future.delayed(Duration(seconds: 1));
      userPaketSemester.initData(value.toString());
      _dialog.hide();
    }

    userPaketSemester.initData(_valSemester);


    Future<void> refresh() {
      user.refreshData();
      userPaketSemester.refreshData();
      return userPaketSemester.refreshData();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Data Jadwal Kuliah',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  SizedBox(
                          width: double.infinity,
                          child: Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xFFE7E7E7),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text("Pilih Semester",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Color(0xFF808080))),
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 28,
                                value: _valSemester,
                                isExpanded: true,
                                items: user.data?.data?.map((value) {
                                  return DropdownMenuItem(
                                    child: user.isLoading
                                        ? ShimmerWidget(
                                      height: 20,
                                      width: 200,
                                    )
                                        : Text(
                                      value.semNama,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color(0xFF808080),
                                          fontSize: 14),
                                    ),
                                    value: value.semId,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _valSemester = value.toString();
                                    initDataPaketSemester(value.toString());
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: RefreshIndicator(
                  onRefresh: refresh,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Consumer<DosenJadwalPerkuliahanPerSemesterState>(
                      builder: (context, value, child) {
                        return value.isLoading
                            ? ShimmerListTile()
                            : ListJadwalPerkuliahanDosen(context, value);
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
