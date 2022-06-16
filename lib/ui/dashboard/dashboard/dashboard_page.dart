import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/states/profil/state_dosen_profil.dart';
import 'package:portal_akademik_dosen/ui/dashboard/dashboard/component/exception_handle_dashboard.dart';
import 'package:portal_akademik_dosen/ui/dashboard/drawer/drawer_navigator.dart';
import 'package:portal_akademik_dosen/utils/color_pallete.dart';
import 'package:portal_akademik_dosen/utils/widget/shimmer_widget.dart';

import '../../../states/state.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {

    DosenProfilState user =
        Provider.of<DosenProfilState>(context, listen: true);

    Future<void> refresh() {
      user.refreshData();
      return user.refreshData();
    }

    return Scaffold(
      drawer: const DrawerNavigator(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(width: 1, color: ColorPallete.primary),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                user.isLoading
                    ? ShimmerWidget(
                        borderRadius: BorderRadius.circular(80.0),
                        height: 50,
                        width: 50,
                      )
                    : getPhotoDosen(context, user),
                const SizedBox(height: 8),
                Container(
                    padding: const EdgeInsets.all(2.0),
                    child: user.isLoading
                        ? ShimmerWidget(
                            height: 20,
                            width: 100,
                          )
                        : getNameDosen(context, user)),
                Container(
                    padding: const EdgeInsets.all(4.0),
                    child: user.isLoading
                        ? ShimmerWidget(
                            height: 20,
                            width: 100,
                          )
                        : getNipDosen(context, user)),
                const SizedBox(height: 2),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Jabatan',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: user.isLoading
                                  ? ShimmerWidget(
                                      width: 100,
                                      height: 20,
                                    )
                                  : getJabatanDosen(context, user)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Fakultas',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: user.isLoading
                                  ? ShimmerWidget(
                                      width: 100,
                                      height: 20,
                                    )
                                  : getFakultasDosen(context, user)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Program Studi',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: user.isLoading
                                  ? ShimmerWidget(
                                      width: 100,
                                      height: 20,
                                    )
                                  : getProgramStudiDosen(context, user)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
