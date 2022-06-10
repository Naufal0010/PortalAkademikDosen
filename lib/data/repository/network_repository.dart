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
            '/simpeg/dosen/19880925201703110001?with[]=prodi&with[]=jurusan&with[]=fakultas');
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
