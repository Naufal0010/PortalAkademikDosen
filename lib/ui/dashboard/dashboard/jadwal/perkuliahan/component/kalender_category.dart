// import 'package:flutter/material.dart';
//
// import '../../../../../../states/state.dart';
// import '../../../../../../utils/color_pallete.dart';
//
//
// List<String> selectedCategory = ['Semua'];
// String all = 'Semua';
// String category1 = 'Senin';
// String category2 = 'Selasa';
// String category3 = 'Rabu';
// String category4 = 'Kamis';
// String category5 = 'Jumat';
//
// class KalenderCategory extends StatefulWidget {
//   @override
//   State<KalenderCategory> createState() => _LinkKalenderState();
// }
//
// class _LinkKalenderState extends State<KalenderCategory> {
//   @override
//   Widget build(BuildContext context) {
//
//     UserMahasiswaJadwalFilterState jadwal =
//     Provider.of<UserMahasiswaJadwalFilterState>(context, listen: true);
//
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Column(
//         children: <Widget>[
//           Container(
//             child: Container(
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         InkWell(
//                           splashColor: Colors.orangeAccent,
//                           borderRadius: BorderRadius.circular(10),
//                           onTap: () {
//                             selectedCategory = [];
//                             selectedCategory.add(all);
//                             jadwal.refreshData();
//                             jadwal.initData();
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 10),
//                             margin: EdgeInsets.only(right: 10),
//                             decoration: BoxDecoration(
//                               color: selectedCategory.contains(all)
//                                   ? ColorPallete.primary
//                                   : Colors.grey.shade300,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Semua',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           splashColor: Colors.orangeAccent,
//                           borderRadius: BorderRadius.circular(10),
//                           onTap: () {
//                             selectedCategory = [];
//                             selectedCategory.add(category1);
//                             jadwal.initDataFilter('Senin');
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 10),
//                             margin: EdgeInsets.only(right: 10),
//                             decoration: BoxDecoration(
//                               color: selectedCategory.contains(category1)
//                                   ? ColorPallete.primary
//                                   : Colors.grey.shade300,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Senin',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           splashColor: Colors.orangeAccent,
//                           borderRadius: BorderRadius.circular(15),
//                           onTap: () {
//                             selectedCategory = [];
//                             selectedCategory.add(category2);
//                             jadwal.initDataFilter('Selasa');
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 10),
//                             margin: EdgeInsets.only(right: 10),
//                             decoration: BoxDecoration(
//                               color: selectedCategory.contains(category2)
//                                   ? ColorPallete.primary
//                                   : Colors.grey.shade300,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Selasa',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           splashColor: Colors.orangeAccent,
//                           borderRadius: BorderRadius.circular(15),
//                           onTap: () {
//                             selectedCategory = [];
//                             selectedCategory.add(category3);
//                             jadwal.initDataFilter('Rabu');
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 10),
//                             margin: EdgeInsets.only(right: 10),
//                             decoration: BoxDecoration(
//                               color: selectedCategory.contains(category3)
//                                   ? ColorPallete.primary
//                                   : Colors.grey.shade300,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Rabu',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           splashColor: Colors.orangeAccent,
//                           borderRadius: BorderRadius.circular(15),
//                           onTap: () {
//                             selectedCategory = [];
//                             selectedCategory.add(category4);
//                             jadwal.initDataFilter('Kamis');
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 10),
//                             margin: EdgeInsets.only(right: 10),
//                             decoration: BoxDecoration(
//                               color: selectedCategory.contains(category4)
//                                   ? ColorPallete.primary
//                                   : Colors.grey.shade300,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Kamis',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           splashColor: Colors.orangeAccent,
//                           borderRadius: BorderRadius.circular(15),
//                           onTap: () {
//                             selectedCategory = [];
//                             selectedCategory.add(category5);
//                             jadwal.initDataFilter('Jumat');
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 10),
//                             margin: EdgeInsets.only(right: 10),
//                             decoration: BoxDecoration(
//                               color: selectedCategory.contains(category5)
//                                   ? ColorPallete.primary
//                                   : Colors.grey.shade300,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Jumat',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
