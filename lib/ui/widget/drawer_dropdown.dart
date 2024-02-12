import 'package:booking/features/home/models/drawer_city_model.dart';
import 'package:flutter/material.dart';

import '../../features/home/data/HomeController.dart';

// const List<String> list = <String>[
//   'Москва и МО',
//   'Москва и МО 1',
//   'Москва и МО 2',
//   'Москва и МО 3'
// ];
//


class DrawerDropdown extends StatefulWidget {
  const DrawerDropdown({super.key, required this.controller});
  final HomeController controller;

  @override
  State<DrawerDropdown> createState() => _DrawerDropdownState();
}

class _DrawerDropdownState extends State<DrawerDropdown> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.fetchDrawerCity();
  }
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(listenable: widget.controller, builder: (context, Widget? child){
      if (widget.controller.dawerLoading == true) {
        return Center(child: const CircularProgressIndicator());
      }
      else{
        return  Container(
          width: 200,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: DropdownButton(
                value: widget.controller.selectedDrawerCity,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                onChanged: ( value) {
                  // This is called when the user selects an item.
                  if (value is City) {
                    widget.controller.selectDrawerCity(value);
                      print(widget.controller.selectedDrawerCityId);
                  }
                  if (value is MskCity) {
                    widget.controller.selectDrawerCity(value);
                      print(widget.controller.selectedDrawerCityId);
                  }
                },
                underline: Container(),
                items: [
                  ...widget.controller.drawerCityList!.map(( value) {
                  //  print(value.city);
                    return DropdownMenuItem(
                      value: value,
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          value.city!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2f2f2f),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    );
                  }).toList(),
                  ///
                  ...widget.controller.drawerMskCityList!.map(( value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          value.name!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2f2f2f),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    );
                  }).toList(),

                ]
            ),
          ),
        );
      }
    });
  }
}
