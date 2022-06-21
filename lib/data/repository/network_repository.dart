import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:portal_akademik_dosen/config/preference.dart';
import 'package:portal_akademik_dosen/models/model_api.dart';
import 'package:portal_akademik_dosen/utils/api/consumer.dart';

import '../../models/kuesioner/model_dosen_kuesioner_kepuasan_simpan_data.dart';
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

  // --------------------------------------------------------------------------

  // -------------------- Penawaran Mata Kuliah -------------------------------

  // getPenawaranMataKuliah() untuk mengambil data penawaran mata kuliah
  Future<ApiModel> getPenawaranMataKuliah() async {
    return await consumer.execute(
        url: '/akademik/krs/semesterTawar/dosen/$username');
  }

  // getDosenPenawaranMataKuliah(paketTawar) untuk mengambil data mata kuliah
  // penawaran sesuai paketTawar id
  Future<ApiModel> getDosenPenawaranMataKuliah(String paketTawar) async {
    return await consumer.execute(
        url: '/akademik/krs/matakuliahTawar/dosen/$paketTawar/$username');
  }

  // getListDosenPenawaranMataKuliah(idKelas) untuk mengambil data list dosen
  // dari mata kuliah yang dipilih
  Future<ApiModel> getListDosenPenawaranMataKuliah(String idKelas) async {
    return await consumer.execute(
        url: '/akademik/krs/matakuliahTawar/info/$idKelas');
  }

  // --------------------------------------------------------------------------

  // ------------------------------ Kuesioner ---------------------------------

  // getKuesionerKepuasanPenilaianDosen(nipDosen) untuk mengambil data list
  // pertanyaan kuesioner kepuasan dosen
  Future<ApiModel> getKuesionerKepuasanPenilaianDosen(String nipDosen) async {
    return await consumer.execute(
        url: '/akademik/kuisionerDosenPenilaian/dataKuisioner/$username');
  }

  // postTambahDataKuesionerKepuasanDosen(model...) untuk post data ke database
  Future<ApiModel> postTambahDataKuesionerKepuasanDosen(
      ModelDosenKuesionerKepuasanSimpanData
          modelDosenKuesionerKepuasanSimpanData) async {
    FormData formData =
        FormData.fromMap(modelDosenKuesionerKepuasanSimpanData.toMap());
    return await consumer.execute(
        url: '/akademik/kuisionerDosenPenilaian/createBatchKuisionerDosen',
        method: MethodRequest.POST,
        formData: formData);
  }

  // getSemesterDosenAmpu() untuk mengambil data semester yang dosen ampu
  Future<ApiModel> getSemesterDosenAmpu() async {
    return await consumer.execute(
        url: '/akademik/dosenAmpu/SemesterAmpu/$username');
  }

  // getDataHasilKuesionerDosen(semId) untuk mengambil data hasil kuesioner dosen
  Future<ApiModel> getDataHasilKuesionerDosen(String semId) async {
    return await consumer.execute(
        url:
            '/akademik/kuisionerPenilaian/hasilKuisionerMahasiswa/$semId/$username');
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
