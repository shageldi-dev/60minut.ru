import 'package:booking/features/home/data/RatingController.dart';
import 'package:booking/features/home/models/detail_model.dart';
import 'package:booking/ui/widget/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Recall extends StatefulWidget {
  const Recall({super.key, required this.hotelDetails});
  final HotelDetails hotelDetails;
  @override
  State<Recall> createState() => _RecallState();
}

class _RecallState extends State<Recall> {
  final controller = RatingController();
  String name = "";
  String phone = "";
  bool agree = true;
  bool loading = false;

  add() {
    setState(() {
      loading = true;
    });
    controller.recall(int.parse(widget.hotelDetails.hotel!.id!), name, phone,
        () {
      context.pop();
      setState(() {
        loading = false;
      });
    }, () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (BuildContext context, Widget? child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Позвоните мне',
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
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'на отель “${widget.hotelDetails.hotel!.name!}”',
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //           color: Color(0xFFE50914),
                //           fontSize: 22,
                //           fontFamily: 'MullerNarrow',
                //           fontWeight: FontWeight.w300,
                //         ),
                //       ),
                //     )
                //   ],
                // ),
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
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFFE0E0E0)),
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
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFFE0E0E0)),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            agree = !agree;
                          });
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 2, color: Color(0xFFC7C7C7)),
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
                                  color: agree
                                      ? Color(0xFFE50914)
                                      : Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text(
                          'Я даю согласие на обработку персональных данных ',
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
                  child: MyElevatedButton(
                    onPressed: () {
                      if (agree) {
                        add();
                      } else {
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Container(
                                child: Text(
                                    "Я даю согласие на обработку персональных данных "),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: loading
                        ? SizedBox(
                            child: CircularProgressIndicator(),
                            width: 30.0,
                            height: 30.0,
                          )
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
        });
  }
}
