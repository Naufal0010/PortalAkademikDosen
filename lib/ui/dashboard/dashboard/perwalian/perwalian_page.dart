import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/perwalian/state_dosen_perwalian_mahasiswa.dart';
import 'package:portal_akademik_dosen/utils/service/logger.dart';

import '../../../../states/state.dart';
import '../../../../utils/widget/shimmer_list_tile.dart';
import 'component/empty_perwalian_mahasiswa.dart';
import 'component/list_component_perwalian_mahasiswa.dart';

class PerwalianPage extends StatefulWidget {
  @override
  State<PerwalianPage> createState() => _PerwalianPageState();
}

class _PerwalianPageState extends State<PerwalianPage> {
  String _event = 'Pilih Filter';

  @override
  Widget build(BuildContext context) {

    DosenPerwalianMahasiswaState userPerwalian =
    Provider.of<DosenPerwalianMahasiswaState>(context, listen: false);

    Widget _filter(String value) {
      if (value == 'Semua Mahasiswa') {
        return Consumer<DosenPerwalianMahasiswaState>(
          builder: (context, value, child) {
            return value.isLoading
                ? ShimmerListTile()
                : ListPerwalianMahasiswa(context, userPerwalian);
          },
        );
      } else if (value == 'Registrasi') {
        return Consumer<DosenPerwalianMahasiswaState>(
          builder: (context, value, child) {
            return value.isLoading
                ? ShimmerListTile()
                : ListPerwalianMahasiswa(context, userPerwalian);
          },
        );
      } else if (value == 'Kirim KRS') {
        return Consumer<DosenPerwalianMahasiswaState>(
          builder: (context, value, child) {
            return value.isLoading
                ? ShimmerListTile()
                : ListPerwalianMahasiswa(context, userPerwalian);
          },
        );
      } else if (value == 'KRS Disetujui') {
        return Consumer<DosenPerwalianMahasiswaState>(
          builder: (context, value, child) {
            return value.isLoading
                ? ShimmerListTile()
                : ListPerwalianMahasiswa(context, userPerwalian);
          },
        );
      } else if (value == 'Revisi') {
        return Consumer<DosenPerwalianMahasiswaState>(
          builder: (context, value, child) {
            return value.isLoading
                ? ShimmerListTile()
                : ListPerwalianMahasiswa(context, userPerwalian);
          },
        );
      }

      return Container(
          width: MediaQuery.of(context).size.width,
          height: 500,
          child: EmptyPerwalianMahasiswa());
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Perwalian Mahasiswa',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
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
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                    hint: Text("Pilih Filter",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Color(0xFF808080))),
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 28,
                    value: _event,
                    isExpanded: true,
                    items: [
                      'Pilih Filter',
                      'Semua Mahasiswa',
                      'Registrasi',
                      'Kirim KRS',
                      'KRS Disetujui',
                      'Revisi'
                    ].map((value) {
                      return DropdownMenuItem(
                        child: Text(
                          value,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style:
                              TextStyle(color: Color(0xFF808080), fontSize: 14),
                        ),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _event = newValue.toString();
                        UtilLogger.log('Pilihan', _event);

                        if (newValue.toString() == 'Semua Mahasiswa') {
                          userPerwalian.refreshData();
                          userPerwalian.initData();
                        } else if (newValue.toString() ==  'Registrasi') {
                          userPerwalian.refreshData();
                          userPerwalian.initDataRegistrasi();
                        } else if (newValue.toString() == 'Kirim KRS') {
                          userPerwalian.refreshData();
                          userPerwalian.initDataKirimKrs();
                        } else if (newValue.toString() == 'KRS Disetujui') {
                          userPerwalian.refreshData();
                          userPerwalian.initDataKrsDisetujui();
                        } else if (newValue.toString() == 'Revisi') {
                          userPerwalian.refreshData();
                          userPerwalian.initDataRevisi();
                        }
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
                child:  SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: _filter(_event)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
