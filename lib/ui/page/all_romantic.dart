// import 'package:booking/core/api_end_points.dart';
// import 'package:booking/features/home/data/HomeController.dart';
// import 'package:booking/ui/theme/typography.dart';
// import 'package:booking/ui/widget/romantic/rom_list.dart';
// import 'package:flutter/material.dart';
//
// class RomanticHotelsPage extends StatefulWidget {
//   const RomanticHotelsPage({super.key});
//
//   @override
//   State<RomanticHotelsPage> createState() => _AllHotelsPageState();
// }
//
// class _AllHotelsPageState extends State<RomanticHotelsPage> {
//   final _controller = HomeController();
//
//   @override
//   void initState() {
//     String path = ApiEndPoints.romantic;
//     _controller.fetchHotels(path);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: ListenableBuilder(
//         listenable: _controller,
//         builder: (BuildContext context, Widget? child) {
//           if (_controller.hotelLoading) {
//             return Center(child: const CircularProgressIndicator());
//           }
//           return Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 alignment: Alignment.center,
//                 child: Text(
//                     "Мы нашли для вас ${_controller.romanticHotels.length} отелей",
//                     style: mullerNarrowStyle.copyWith(
//                         fontWeight: FontWeight.w300, fontSize: 24)),
//               ),
//               RomList(items: _controller.romanticHotels),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }