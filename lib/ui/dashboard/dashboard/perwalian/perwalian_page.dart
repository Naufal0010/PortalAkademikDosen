import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/ui/dashboard/drawer/drawer_navigator.dart';

class PerwalianPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Perwalian Mahasiswa',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}