import 'package:booking/features/home/models/filter_options.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/utils/input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:textfields/textfields.dart';

class FilterPrice extends StatelessWidget {
  final FilterOptions? result;
  const FilterPrice({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                'От',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 12,),
              Expanded(
                flex: 1,
                child:  TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: result!=null?[
                    NumericalRangeFormatter(min: result!.priceF?.toDouble()??0.0, max: result!.priceT?.toDouble()??5000.0)
                  ]:[],
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 2.0),
                    ),
                    hintText: '${result?.priceF} ₽',
                  ),
                ),
              ),
              SizedBox(width: 12,),
              Text(
                'до',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 12,),
              Expanded(
                flex: 1,
                child:  TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: result!=null?[
                  NumericalRangeFormatter(min: result!.priceF?.toDouble()??0.0, max: result!.priceT?.toDouble()??5000.0)
                  ]:[],
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 2.0),
                    ),
                    hintText: '${result?.priceT} ₽',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
