import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/dashboard_page.dart';
import 'package:portal_akademik_dosen/ui/dashboard/drawer/drawer_navigator.dart';

class BasePage extends StatefulWidget {

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: const [
            DrawerNavigator(),
            DashboardPage()
          ],
        ),
      )
    );
  }
}
