import 'package:flutter/material.dart';
import 'package:portal_akademik_dosen/utils/widget/shimmer_widget.dart';

class ShimmerListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 8.0,
          ),
          ShimmerWidget(
            width: double.infinity,
            height: 100,
            borderRadius: BorderRadius.circular(20.0),
          ),
          SizedBox(
            height: 8.0,
          ),
          ShimmerWidget(
            width: double.infinity,
            height: 100,
            borderRadius: BorderRadius.circular(20.0),
          ),
          SizedBox(
            height: 8.0,
          ),
          ShimmerWidget(
            width: double.infinity,
            height: 100,
            borderRadius: BorderRadius.circular(20.0),
          ),
          SizedBox(
            height: 8.0,
          ),
          ShimmerWidget(
            width: double.infinity,
            height: 100,
            borderRadius: BorderRadius.circular(20.0),
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
