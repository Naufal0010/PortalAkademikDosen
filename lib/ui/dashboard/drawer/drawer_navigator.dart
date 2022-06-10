import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/utils/color_pallete.dart';

class DrawerNavigator extends StatefulWidget {
  const DrawerNavigator({Key? key}) : super(key: key);

  @override
  State<DrawerNavigator> createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPallete.primary,
    );
  }
}
