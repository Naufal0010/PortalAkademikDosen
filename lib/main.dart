import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Application.preferences = await SharedPreferences.getInstance();

  runApp(App());
}

