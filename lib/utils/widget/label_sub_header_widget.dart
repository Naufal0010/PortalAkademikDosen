import 'package:flutter/material.dart';

class LabelSubHeader extends StatelessWidget {
  final String nameHeader;
  final double fontSizeText;

  LabelSubHeader(this.nameHeader, this.fontSizeText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      child: Text(
        nameHeader,
        style: TextStyle(
          fontSize: fontSizeText,
          fontWeight: FontWeight.bold,
          color: Color(0xff020202),
        ),
      ),
    );
  }
}
