import 'package:flutter/material.dart';

class HasilEvaluasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Hasil Evaluasi Dosen',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
