import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik_dosen/states/kuesioner/state_dosen_kuesioner_kepuasan.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../../../../../states/state.dart';
import '../../../../../../utils/color_pallete.dart';
import '../../../../../../utils/service/logger.dart';
import 'kuesioner_kepuasan_list_tile.dart';

Widget ListKuesionerKepuasanDosen(
    BuildContext context, DosenKuesionerKepuasanState state) {

  SimpleFontelicoProgressDialog _dialog =
  SimpleFontelicoProgressDialog(context: context, barrierDimisable: true);

  void postData() async {
    DosenKuesionerKepuasanState user =
    Provider.of<DosenKuesionerKepuasanState>(context,
        listen: false);
    _dialog.show(
        message: 'Loading...',
        type: SimpleFontelicoProgressDialogType.normal,
        indicatorColor: ColorPallete.primary);
    await Future.delayed(Duration(seconds: 1));
    await user.postDataKuesionerKepuasanDosen(context);
    user.refreshData();
    _dialog.hide();
  }

  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  UtilLogger.log("Error Message", "${state.errorMessage}");

  if (state.data?.kuisioner?.length == null) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 600,
      child: Html(
        data: """
               ${state.errorMessage}
              """,
        style: {
          "body": Style(
            fontFamily: 'Poppins',
            textAlign: TextAlign.center,
            fontSize: FontSize(16.0),
          ),
        },
      ),
    );
  }

  return Column(
    children: [
      Column(
        children: state.data!.kuisioner!
            .map(
              (e) => KuesionerKepuasanListTile(
                data: e,
                dataKuesioner: state.data?.kuisioner,
              ),
            )
            .toList(),
      ),
      SizedBox(
        height: 8,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            postData();
          },
          child: Text(
            'Simpan',
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.deepPurpleAccent,
              onPrimary: Colors.white),
        ),
      ),
    ],
  );
}
