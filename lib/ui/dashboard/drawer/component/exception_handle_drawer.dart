import 'package:flutter/material.dart';

import '../../../../states/profil/state_dosen_profil.dart';

Widget getPhotoDosenDrawer(BuildContext context, DosenProfilState state) {
  if (state.error != null) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.grey,
      foregroundColor: Colors.grey,
    );
  }

  if (state.data?.foto == null) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.grey,
      foregroundColor: Colors.grey,
    );
  }

  return CircleAvatar(
    radius: 24,
    backgroundColor: Colors.grey,
    foregroundColor: Colors.grey,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child:
          Image.network('https://portal.ulm.ac.id/uploads/${state.data?.foto}'),
    ),
  );
}

Widget getNameDosenDrawer(BuildContext context, DosenProfilState state) {
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
    style: TextStyle(fontSize: 14, color: Colors.white),
  );
}

Widget getNipDosenDrawer(BuildContext context, DosenProfilState state) {
  if (state.error != null) {
    return Text('Loading');
  }

  if (state.data?.nip == null) {
    return Text(
      'Loading',
    );
  }

  return Text(
    '${state.data!.nip}',
    style: TextStyle(fontSize: 12.0, color: Colors.white),
  );
}
