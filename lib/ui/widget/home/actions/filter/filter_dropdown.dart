import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/features/home/models/filter_options.dart' as filter;
import 'package:flutter/material.dart';


///district
class FilterDropdownRegion extends StatelessWidget {
  final HomeController controller;
  const FilterDropdownRegion({
    super.key,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {

    return ListenableBuilder(listenable: controller, builder: (context, _){
      return  Container(
        width: double.infinity,
        child: Card(
          elevation: 0,
          color: Color(0xFFF5F5F5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: DropdownButton(
              value: controller.selecteDistrict,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              hint: Text(
                'Выберите район',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff2f2f2f),
                ),
                textAlign: TextAlign.left,
              ),
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: ( value) {
                if (value is filter.Area) {
                  controller.selectDistrictId(value);
                  print(controller.selecteDistrictId);
                }
              },
              underline: Container(),
              items: controller.districtList!.map(( value) {
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
            ),
          ),
        ),
      );
    });
  }
}


///area
class FilterDropdownCity extends StatelessWidget {
  final HomeController controller;


  const FilterDropdownCity({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(listenable: controller, builder: (context, _){
      return  Container(
        width: double.infinity,
        child: Card(
          elevation: 0,
          color: Color(0xFFF5F5F5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: DropdownButton(
              value: controller.selecteArea,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              hint: Text(
                'Выберите город',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff2f2f2f),
                ),
                textAlign: TextAlign.left,
              ),
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: ( value) {
                if (value is filter.Area) {
                  controller.selectAreaId(value);
                  print(controller.selectedAreaId);
                }
              },
              underline: Container(),
              items: controller.areaList!.map(( value) {
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
            ),
          ),
        ),
      );
    });
  }
}



class FilterDropdownMetro extends StatelessWidget{
  const FilterDropdownMetro({super.key,required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(listenable: controller, builder: (context, _){
      return  Container(
        width: double.infinity,
        child: Card(
          elevation: 0,
          color: Color(0xFFF5F5F5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: DropdownButton(
              value: controller.selectedMetro,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              hint: Text(
                'Выберите метро',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff2f2f2f),
                ),
                textAlign: TextAlign.left,
              ),
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: ( value) {
                if (value is filter.Metro) {
                  controller.selectMetroId(value);
                  print(controller.selectedFilterMetroId);
                }
              },
              underline: Container(),
              items: controller.metroList!.map(( value) {
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
            ),
          ),
        ),
      );
    });
  }
}
