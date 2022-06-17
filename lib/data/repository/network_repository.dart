import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/config/preference.dart';
import 'package:portal_akademik_dosen/models/model_api.dart';
import 'package:portal_akademik_dosen/utils/api/consumer.dart';

import '../../utils/service/util_preference.dart';

/*
*
* Class NetworkRepository berfungsi untuk menampung function yang bertujuan
* mengambil dari API
*
* */

class NetworkRepository {
  String? username = UtilPreferences.getString('username');

  static ApiConsumer consumer = ApiConsumer(
      apiUrl: !kDebugMode
          ? 'http://api-siapps.gov.id/api'
          : 'https://git.ulm.ac.id/api-siapps/public/api',
      appId: 'PortalAkademikDosen',
      apiKey: '605dafe39ee0780e8cf2c829434eea11',
      apiTimeout: 20);

  // getUser() untuk mengambil data mahasiswa dengan program studi dari API
  Future<ApiModel> getUser() async {
    return await consumer.execute(
        url:
            '/simpeg/dosen/$username?with[]=prodi&with[]=jurusan&with[]=fakultas');
  }

  // ----------------------------- Jadwal Dosen ------------------------------

  // getJadwaPentingDosen() untuk mengambil data jadwal penting dosen
  Future<ApiModel> getJadwalPentingDosen() async {
    return await consumer.execute(url: '/akademik/jadwal/penting');
  }

  // getRiwayatSemesterDosen() untuk mengambil data riwayat semester dosen
  Future<ApiModel> getRiwayatSemesterDosen() async {
    return await consumer.execute(
        url: '/akademik/riwayatSemester/dosen/$username');
  }

  // getJadwalPerkuliahanPerSemester(semId) untuk mengambil data jadwal perkuliahan
  // per semester
  Future<ApiModel> getJadwalPerkuliahanPerSemester(String semId) async {
    return await consumer.execute(
        url: '/akademik/jadwal/dosen/kuliah/$username/$semId');
  }

  // getJadwalUas(semId) untuk mengambil data jadwal uas dosen
  Future<ApiModel> getJadwalUas(String semId) async {
    return await consumer.execute(
        url: '/akademik/jadwal/dosen/kuliah/$username/$semId');
  }

  // refreshToken() jika access token expired
  Future refreshToken() async {
    FormData formData = FormData.fromMap({
      "tokenRefresh": UtilPreferences.getString(Preferences.refreshToken),
    });

    final response = await consumer.execute(
        url: '/auth/refresh', formData: formData, method: MethodRequest.PUT);

    if (response.code == CODE.SUCCESS) {
      return response.data['accessToken'];
    } else {
      return null;
    }
  }

  // auth() untuk mengautensikasi user jika ingin login menggunakan username dan password
  Future auth(String? username, String? password) async {
    return await consumer.auth(username: username, password: password);
  }
}
