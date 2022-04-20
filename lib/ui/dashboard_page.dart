import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {

                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
