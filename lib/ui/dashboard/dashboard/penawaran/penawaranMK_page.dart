import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/models/penawaran/model_penawaran_mata_kuliah_list.dart';
import 'package:portal_akademik_dosen/states/penawaran/state_dosen_penawaran_mata_kuliah.dart';
import 'package:portal_akademik_dosen/utils/widget/shimmer_list_tile.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../../../states/penawaran/state_dosen_penawaran_mata_kuliah_dipilih.dart';
import '../../../../states/state.dart';
import '../../../../utils/color_pallete.dart';
import '../../../../utils/service/logger.dart';
import '../../../../utils/widget/shimmer_widget.dart';
import 'component/list_component_penawaran_matakuliah.dart';

class PenawaranMKPage extends StatefulWidget {
  @override
  State<PenawaranMKPage> createState() => _PenawaranMKPageState();
}

class _PenawaranMKPageState extends State<PenawaranMKPage> {
  String _valPaketSemester = "0";

  @override
  Widget build(BuildContext context) {
    DosenPenawaranMataKuliahState user =
        Provider.of<DosenPenawaranMataKuliahState>(context, listen: true);

    DosenPenawaranMataKuliahDipilihState userPenawaran =
    Provider.of<DosenPenawaranMataKuliahDipilihState>(context, listen: false);


    SimpleFontelicoProgressDialog _dialog =
    SimpleFontelicoProgressDialog(context: context, barrierDimisable: true);

    void initDataPenawaranMataKuliah(Object? value) async {
      _dialog.show(
          message: 'Loading...',
          type: SimpleFontelicoProgressDialogType.normal,
          indicatorColor: ColorPallete.primary);
      await Future.delayed(Duration(seconds: 1));
      userPenawaran.initData(value.toString());
      _dialog.hide();
    }

    List<ModelDosenPenawaranMataKuliah>? list = user
        .dataPaketSemester?.data?.entries
        .map((e) => ModelDosenPenawaranMataKuliah(e.key, e.value))
        .toList();

    list?.insert(0, ModelDosenPenawaranMataKuliah("0", "Pilih Semester"));

    userPenawaran.initData(_valPaketSemester);

    Future<void> refresh() {
      user.refreshData();
      return userPenawaran.refreshData();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Data Penawaran Mata Kuliah',
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
                          value: _valPaketSemester,
                          isExpanded: true,
                          items: list?.map((value) {
                            UtilLogger.log('value paket semester', value);
                            return DropdownMenuItem(
                              child: Text(
                                value.valuePaketSemester,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Color(0xFF808080), fontSize: 14),
                              ),
                              value: value.keyPaketSemester,
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _valPaketSemester = newValue.toString();
                              initDataPenawaranMataKuliah(newValue.toString());
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
                    child: Consumer<DosenPenawaranMataKuliahDipilihState>(
                      builder: (context, value, child) {
                        return value.isLoading
                            ? ShimmerListTile()
                            : ListMataKuliahPenawaran(context, value);
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
