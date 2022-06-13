import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/state.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/dashboard_page.dart';
import 'package:portal_akademik_dosen/ui/login/login_page.dart';

class App extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthState())],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          home: WillPopScope(
            child: Consumer<AuthState>(
              builder: (context, percentDone, child) {
                return context.watch<AuthState>().isLogged
                    ? const DashboardPage()
                    : const LoginPage();
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
