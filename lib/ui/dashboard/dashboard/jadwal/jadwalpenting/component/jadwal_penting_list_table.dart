import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:portal_akademik_dosen/states/jadwal/state_dosen_jadwal_penting.dart';

import '../../../../../../states/state.dart';
import '../../../../../../utils/color_pallete.dart';

class JadwalPentingListTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    DosenJadwalPentingState jadwalPenting =
    Provider.of<DosenJadwalPentingState>(context, listen: true);

    return Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorPallete.primary),
          // color: Colors.amber,
        ),
        child: SizedBox(
          width: double.infinity,
          child: HorizontalDataTable(
            leftHandSideColumnWidth: 100,
            rightHandSideColumnWidth: 450,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: jadwalPenting.data == null ? 0 : jadwalPenting.data!.data!.length,
            rowSeparatorWidget: const Divider(
              color: Colors.orange,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
            rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
            horizontalScrollbarStyle: const ScrollbarStyle(
                thumbColor: Colors.orange,
                isAlwaysShown: true,
                thickness: 3.0,
                radius: Radius.circular(5.0)),
            verticalScrollbarStyle: const ScrollbarStyle(
                thumbColor: Colors.orange,
                isAlwaysShown: true,
                thickness: 2.0,
                radius: Radius.circular(5.0)),
          ),
        )
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      SizedBox(
        width: 100,
        child: Container(
          child: Text('Jadwal',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ),
      SizedBox(
        width: 150,
        child: Container(
          child: Text('Semester',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ),
      SizedBox(
        width: 150,
        child: Container(
          child: Text('Mulai',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ),
      SizedBox(
        width: 150,
        child: Container(
          child: Text('Selesai',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ),
    ];
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {

    DosenJadwalPentingState jadwalPenting =
    Provider.of<DosenJadwalPentingState>(context, listen: true);

    return SizedBox(
      width: 150,
      child: Container(
        child: Text(jadwalPenting.data!.data![index].jadwal,
            style: TextStyle(fontSize: 12.0)),
        height: 100,
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {

    DosenJadwalPentingState jadwalPenting =
    Provider.of<DosenJadwalPentingState>(context, listen: true);

    return Row(
      children: <Widget>[

        SizedBox(
          width: 150,
          height: 100,
          child: Container(
            child: Text(jadwalPenting.data!.data![index].semester.toString(),
                style: TextStyle(fontSize: 12.0)),
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
        ),
        SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                child: Text(jadwalPenting.data!.data![index].tglMulai.toString(),
                    style: TextStyle(fontSize: 12.0)),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(jadwalPenting.data!.data![index].jamMulai.toString(),
                    style: TextStyle(fontSize: 12.0)),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                child: Text(jadwalPenting.data!.data![index].tglSelesai.toString(),
                    style: TextStyle(fontSize: 12.0)),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(jadwalPenting.data!.data![index].jamSelesai.toString(),
                    style: TextStyle(fontSize: 12.0)),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
