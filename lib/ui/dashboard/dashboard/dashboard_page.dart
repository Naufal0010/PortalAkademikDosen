import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portal_akademik_dosen/utils/color_pallete.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawer = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          xOffset = 0;
          yOffset = 0;
          scaleFactor = 1;
          isDrawer = false;
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Colors.grey
          ));
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        duration: Duration(milliseconds: 250),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                isDrawer
                    ? IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawer  = false;
                            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                                statusBarColor: Colors.grey
                            ));
                          });
                        })
                    : IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            xOffset = 200;
                            yOffset = 140;
                            scaleFactor = 0.6;
                            isDrawer  = true;
                            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                              statusBarColor: ColorPallete.primary
                            ));
                          });
                        }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
