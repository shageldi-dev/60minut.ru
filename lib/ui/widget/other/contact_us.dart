
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_by_time.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_dropdown.dart';
import 'package:booking/ui/widget/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(child:Text(
                  'Обратная связь',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 24,
                    fontFamily: 'MullerNarrow',
                    fontWeight: FontWeight.w800,
                  ),
                ), flex: 90,),
                GestureDetector(child: Expanded(child: Icon(Icons.close),flex: 10,), onTap: ()=>{context.pop()},)
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              child: Column(
                children: [
                  TextField(
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: "Имя",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Color(0xFFE0E0E0)),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(height: 12,),
                  TextField(
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: "Телефон",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Color(0xFFE0E0E0)),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(height: 12,),
                  TextField(
                    minLines: 6, // any number you need (It works as the rows for the textarea)
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: "Комментарий",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Color(0xFFE0E0E0)),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Прошу не звонить, пишите мне через:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF585858),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    RadioMenuButton(value: true, groupValue: true, onChanged: (checked)=>{}, style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(primaryColor),
                      iconColor: MaterialStateProperty.all(primaryColor),
                      surfaceTintColor: MaterialStateProperty.all(primaryColor)
                    ), child: Text(
                      'WhatsApp',
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                    RadioMenuButton(value: true, groupValue: true, onChanged: (checked)=>{}, style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(primaryColor),
                        iconColor: MaterialStateProperty.all(primaryColor),
                        surfaceTintColor: MaterialStateProperty.all(primaryColor)
                    ), child: Text(
                      'Viber',
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                    RadioMenuButton(value: true, groupValue: true, onChanged: (checked)=>{}, style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(primaryColor),
                        iconColor: MaterialStateProperty.all(primaryColor),
                        surfaceTintColor: MaterialStateProperty.all(primaryColor)
                    ), child: Text(
                      'Смс',
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Color(0xFFC7C7C7)),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE50914),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Text(
                    'Я даю согласие на обработку персональных данных',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF2F2F2F),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyElevatedButton(onPressed: () {  },
              child: Text(
                'Отправить',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}

Widget RatingSelect(String text, void Function()? onSelected) {
  return Row(
    children: [
      Expanded(child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF2F2F2F),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      )),
      Expanded(child: FilterDropdown())
    ],
  );
}
