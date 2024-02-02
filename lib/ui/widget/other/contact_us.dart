import 'package:booking/features/home/data/HomeController.dart';
import 'package:booking/ui/theme/color.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_by_time.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_dropdown.dart';
import 'package:booking/ui/widget/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  var _controller = HomeController();

  String phone = "";
  String name = "";
  String text = "";
  String sms = "0";
  String viber = "0";
  String whatsapp = "0";
  bool agree = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Обратная связь',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF2F2F2F),
                      fontSize: 24,
                      fontFamily: 'MullerNarrow',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  flex: 90,
                ),
                GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () => {context.pop()},
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: "Имя",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE0E0E0)),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        phone = value;
                      });
                    },
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: "Телефон",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE0E0E0)),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        text = value;
                      });
                    },
                    minLines:
                        6, // any number you need (It works as the rows for the textarea)
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
                          borderSide:
                              BorderSide(width: 2, color: Color(0xFFE0E0E0)),
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
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CheckboxMenuButton(
                        value: whatsapp == "1",
                        onChanged: (checked) {
                          setState(() {
                            whatsapp = checked == true ? "1" : "0";
                          });
                        },
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(primaryColor),
                            iconColor: MaterialStateProperty.all(primaryColor),
                            surfaceTintColor:
                                MaterialStateProperty.all(primaryColor)),
                        child: Text(
                          'WhatsApp',
                          style: TextStyle(
                            color: Color(0xFF2F2F2F),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    CheckboxMenuButton(
                        value: viber == "1",
                        onChanged: (checked) {
                          setState(() {
                            viber = checked == true ? "1" : "0";
                          });
                        },
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(primaryColor),
                            iconColor: MaterialStateProperty.all(primaryColor),
                            surfaceTintColor:
                                MaterialStateProperty.all(primaryColor)),
                        child: Text(
                          'Viber',
                          style: TextStyle(
                            color: Color(0xFF2F2F2F),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    CheckboxMenuButton(
                        value: sms == "1",
                        onChanged: (checked) {
                          setState(() {
                            sms = checked == true ? "1" : "0";
                          });
                        },
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(primaryColor),
                            iconColor: MaterialStateProperty.all(primaryColor),
                            surfaceTintColor:
                                MaterialStateProperty.all(primaryColor)),
                        child: Text(
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
          GestureDetector(
            onTap: () {
              setState(() {
                agree = !agree;
              });
            },
            child: Padding(
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
                            color:
                                agree ? Color(0xFFE50914) : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
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
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyElevatedButton(
              onPressed: () {
                if (agree) {
                  setState(() {
                    loading = true;
                  });
                  _controller.contactUs(name, phone, text, whatsapp, viber, sms,
                      () {
                    Fluttertoast.showToast(
                        msg:
                            "Ваше сообщение успешно отправлено, с Вами свяжутся в ближайшее время.",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    setState(() {
                      loading = false;
                    });
                  }, () {
                    Fluttertoast.showToast(
                        msg: "Что-то пошло не так!",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    setState(() {
                      loading = false;
                    });
                  });
                }
              },
              child: loading
                  ? CircularProgressIndicator()
                  : Text(
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
      Expanded(
          child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF2F2F2F),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      )),
      Expanded(
          child: FilterDropdownRegion(
        list: [],
        callback: (p0) {},
      ))
    ],
  );
}
