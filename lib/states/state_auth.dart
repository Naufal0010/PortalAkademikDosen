import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik_dosen/config/preference.dart';
import 'package:portal_akademik_dosen/utils/service/logger.dart';
import 'package:portal_akademik_dosen/utils/service/util_preference.dart';

import '../data/repository/network_repository.dart';
import '../models/model_api.dart';

class AuthState with ChangeNotifier {
  bool isLogged = false;
  bool isLoading = true;
  bool showPassword = false;
  Map<String, dynamic>? error;

  AuthState() {
    initData();
  }

  initData() async {
    try {
      ///Setup SharedPreferences
      final hasToken = UtilPreferences.containsKey(Preferences.refreshToken);

      if (hasToken!) {
        isLogged = true;
      } else {
        isLogged = false;
      }

      UtilLogger.log('Login: ', isLogged);

      notifyListeners();
    } catch (e) {
      UtilLogger.log('Error: ', e);
      notifyListeners();
    }
  }

  auth(String? username, String? password) async {
    final auth = await NetworkRepository().auth(username, password);

    if (auth.code == CODE.SUCCESS) {
      UtilPreferences.setToken(
          accessToken: auth.data['accessToken'],
          refreshToken: auth.data['refreshToken']);
      
      UtilPreferences.setUser(
        username: username
      );

      UtilLogger.log('Username', UtilPreferences.getString('username'));

      isLogged = true;
      isLoading = false;
      notifyListeners();
    } else if (auth.code == CODE.VALIDATE) {
      Fluttertoast.showToast(
          msg: 'Usernama atau password salah',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
      isLoading = true;
      error = auth;
      notifyListeners();
    } else {
      Fluttertoast.showToast(
          msg: 'Terjadi kesalahan, coba lagi',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
      isLoading = true;
      error = auth;
      notifyListeners();
    }
  }

  logout() async {
    UtilPreferences.remove(Preferences.accessToken);
    UtilPreferences.remove(Preferences.refreshToken);
    isLogged = false;
    notifyListeners();
  }
}