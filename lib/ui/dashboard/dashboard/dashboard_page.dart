import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/ui/dashboard/drawer/drawer_navigator.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerNavigator(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 100.0,
              ),
            ),
            const Text(
              'RUDY HERTENO',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              'NIP. 19880925201703110001',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
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
                        child: Text(
                          'Dosen',
                          style: TextStyle(fontSize: 15),
                        )),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                        flex: 1,
                        child: Text(
                          'Fakultas',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Text(
                          'Fakultas Matematika dan Ilmu Pengetahuan Alam',
                          style: TextStyle(fontSize: 15),
                        )),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                        flex: 1,
                        child: Text(
                          'Program Studi',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Text(
                          'S1-Ilmu Komputer',
                          style: TextStyle(fontSize: 15),
                        )),
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
