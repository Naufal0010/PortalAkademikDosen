import 'package:flutter/material.dart';

import 'dashboard/dashboard/dashboard_page.dart';
import 'dashboard/drawer/drawer_navigator.dart';

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
