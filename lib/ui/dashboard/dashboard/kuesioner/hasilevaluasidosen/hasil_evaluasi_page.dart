import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/kuesioner/state_dosen_hasil_evaluasi_kuesioner.dart';
import 'package:portal_akademik_dosen/states/kuesioner/state_dosen_semester_ampu.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../../../../models/kuesioner/model_dosen_semester_ampu.dart';
import '../../../../../states/state.dart';
import '../../../../../utils/color_pallete.dart';
import '../../../../../utils/service/logger.dart';
import '../../../../../utils/widget/shimmer_list_tile.dart';
import '../../../../../utils/widget/shimmer_widget.dart';
import 'component/list_component_hasil_evaluasi_dosen.dart';

class HasilEvaluasiPage extends StatefulWidget {
  @override
  State<HasilEvaluasiPage> createState() => _HasilEvaluasiPageState();
}

class _HasilEvaluasiPageState extends State<HasilEvaluasiPage> {
  String _valSemester = "0";

  @override
  Widget build(BuildContext context) {

    DosenSemesterAmpuState user =
    Provider.of<DosenSemesterAmpuState>(context, listen: true);

    DosenHasilEvaluasiKuesionerState userHasil =
    Provider.of<DosenHasilEvaluasiKuesionerState>(context, listen: false);

    SimpleFontelicoProgressDialog _dialog =
    SimpleFontelicoProgressDialog(context: context, barrierDimisable: true);

    void initDataHasilEvaluasi(Object? value) async {
      _dialog.show(
          message: 'Loading...',
          type: SimpleFontelicoProgressDialogType.normal,
          indicatorColor: ColorPallete.primary);
      await userHasil.initData(value.toString());
      _dialog.hide();
    }

    if (user.data?.data?.first.semId != "0") {
      user.data?.data?.insert(0, SemesterAmpu(semId: "0", semTahun: "0", semNama: "Pilih Semester", semAktif: "0", kode: '0'));
    }

    userHasil.initData(_valSemester);

    Future<void> refresh() {
      user.refreshData();
      return userHasil.refreshData();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Hasil Evaluasi Dosen',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            user.isLoading
                ? ShimmerWidget(
              height: 20,
              width: MediaQuery.of(context).size.width,
            )
                : SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFE7E7E7),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                    hint: Text("Pilih Semester",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Color(0xFF808080))),
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 28,
                    value: _valSemester,
                    isExpanded: true,
                    items: user.data?.data?.map((value) {
                      UtilLogger.log('value semester', value);
                      return DropdownMenuItem(
                        child: Text(
                          value.semNama,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: Color(0xFF808080), fontSize: 14),
                        ),
                        value: value.semId,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _valSemester = newValue.toString();
                        initDataHasilEvaluasi(newValue.toString());
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child:  RefreshIndicator(
                  onRefresh: refresh,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Consumer<DosenHasilEvaluasiKuesionerState>(
                      builder: (context, value, child) {
                        return value.isLoading
                            ? ShimmerListTile()
                            : ListHasilEvaluasiDosen(context, value);
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
