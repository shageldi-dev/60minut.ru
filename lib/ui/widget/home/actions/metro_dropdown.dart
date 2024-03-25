import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/features/home/models/filter_options.dart' as filter;
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Москва и МО',
  'Москва и МО 1',
  'Москва и МО 2',
  'Москва и МО 3'
];



class MetroDropdown extends StatelessWidget {
   MetroDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, Widget? child) {
          if (controller.hotelLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            width: double.infinity,
            child: Card(
              color: const Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  alignment: Alignment.center,
                  child:EasyAutocomplete(
                    suggestions: controller.metroList!.map((value) => value.name!).toList(),
                    onChanged: (value) {
                      // controller.selectMetroIdd(value);
                      print('onChanged value: $value');
                    },
                    onSubmitted: (value) {
                      print('onSubmitted value: $value');
                      controller.selectMetroIdd(value);
                    },
                    decoration: const InputDecoration(
                        hintText: 'Выберите метро' ,
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(5),
                        borderSide:BorderSide.none,
                    ),
                    enabledBorder:  UnderlineInputBorder( // Set the bottom border to none
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                ),
              ),

            ),
          );
        });
  }
}

// class MetroDropdown extends StatelessWidget {
//   const MetroDropdown({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListenableBuilder(
//         listenable: controller,
//         builder: (context, Widget? child) {
//           if (controller.hotelLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           return Container(
//             width: double.infinity,
//             child: Card(
//               color: const Color(0xFFF5F5F5),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6)),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                 child: DropdownButton(
//                   value: controller.selectedMetro,
//                   //!= null ? controller.selectedMetro as int : null,//controller.selectedMetro!, //widget.controller.selectedMetro,
//                   isExpanded: true,
//                   icon: const Icon(Icons.arrow_drop_down),
//                   elevation: 16,
//                   style: const TextStyle(color: Colors.deepPurple),
//                   onChanged: (val) {
//                     // This is called when the user selects an item.
//                     // widget.controller.selectMetro(value!);
//                     //  setState(() {
//                     //    widget.dropdownValue = value!;
//                     //  });
//                     //controller.selectedMetro = value;
//                     if (val is filter.Metro) {
//                       controller.selectMetroId(val);
//                       print(controller.selectedMetroIdList);
//                     }
//                   },
//                   underline: Container(),
//                   items: controller.metroList!.map((value) {
//                     // final station = controller.result!.metro![value]!;
//                     return DropdownMenuItem(
//                       value: value,
//                       child: Container(
//                         width: 150,
//                         padding: const EdgeInsets.only(left: 12),
//                         child: Text(
//                           value.name!,
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xff2f2f2f),
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
