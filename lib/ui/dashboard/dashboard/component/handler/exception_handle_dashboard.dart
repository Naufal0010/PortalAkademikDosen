import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik_dosen/states/profil/state_dosen_profil.dart';

Widget getPhotoDosen(BuildContext context, DosenProfilState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey,
      foregroundColor: Colors.grey,
    );
  }

  if (state.data?.foto == null) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey,
      foregroundColor: Colors.grey,
    );
  }

  return SizedBox(
    width: 100,
    child: CircleAvatar(
      radius: 32,
      backgroundColor: Colors.grey,
      foregroundColor: Colors.grey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Image.network(
            'https://portal.ulm.ac.id/uploads/${state.data?.foto}'),
      ),
    ),
  );
}

Widget getNameDosen(BuildContext context, DosenProfilState state) {
  if (state.error != null) {
    return Text('Loading');
  }

  if (state.data?.nama == null) {
    return Text(
      'Loading',
    );
  }

  return Text(
    state.data!.nama,
    style: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget getNipDosen(BuildContext context, DosenProfilState state) {
  if (state.error != null) {
    return Text('Loading');
  }

  if (state.data?.nip == null) {
    return Text(
      'Loading',
    );
  }

  return Text(
    'NIP. ${state.data!.nip}',
    style: TextStyle(
      fontSize: 14.0,
    ),
  );
}

Widget getJabatanDosen(BuildContext context, DosenProfilState state) {
  if (state.error != null) {
    return Text('Loading');
  }

  if (state.data?.statuDosen == null) {
    return Text(
      'Loading',
    );
  }

  return Text(
    state.data!.statuDosen,
    style: TextStyle(
      fontSize: 14.0,
    ),
  );
}

Widget getFakultasDosen(BuildContext context, DosenProfilState state) {
  if (state.error != null) {
    return Text('Loading');
  }

  if (state.data?.fakultas?.namaResmi == null) {
    return Text(
      'Loading',
    );
  }

  return Text(
    state.data!.fakultas!.namaResmi,
    style: TextStyle(
      fontSize: 14.0,
    ),
  );
}

Widget getProgramStudiDosen(BuildContext context, DosenProfilState state) {
  if (state.error != null) {
    return Text('Loading');
  }

  if (state.data?.prodi?.jenjang == null && state.data?.prodi?.nama == null) {
    return Text(
      'Loading',
    );
  }

  return Text(
    '${state.data!.prodi!.jenjang} - ${state.data!.prodi!.nama}',
    style: TextStyle(fontSize: 14),
  );
}
