import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/state.dart';
import 'package:portal_akademik_dosen/ui/dashboard_page.dart';
import 'package:portal_akademik_dosen/ui/login_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthState())
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          home: WillPopScope(
            child: Consumer<AuthState>(
              builder: (context, percentDone, child) {
                return context.watch<AuthState>().isLogged ? DashboardPage() : LoginPage();
              },
            ),
            onWillPop: onWillPop,
          ),
          title: 'Portal Akademik Dosen',
          theme: ThemeData(fontFamily: 'Poppins'),
        ),
      ),
    );
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
      now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }
}
