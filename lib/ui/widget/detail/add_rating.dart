import 'package:booking/features/home/data/RatingController.dart';
import 'package:booking/features/home/models/detail_model.dart';
import 'package:booking/features/home/models/review_request.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_by_time.dart';
import 'package:booking/ui/widget/home/actions/filter/filter_dropdown.dart';
import 'package:booking/ui/widget/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddRating extends StatefulWidget {
  AddRating({super.key, required this.hotelDetails});
  HotelDetails hotelDetails;

  @override
  State<AddRating> createState() => _AddRatingState();
}

class _AddRatingState extends State<AddRating> {
  final controller = RatingController();
  int ratingInfo = 0;
  int ratingPrice = 0;
  int ratingClear = 0;
  int ratingComfort = 0;
  int ratingService = 0;
  String name = "";
  String phone = "";
  String text = "";
  bool agree = true;
  bool loading = false;

  addRating() {
    setState(() {
      loading = true;
    });
    controller.addRating(
        int.parse(widget.hotelDetails.hotel!.id!),
        name,
        phone,
        text,
        ratingInfo,
        ratingPrice,
        ratingClear,
        ratingComfort,
        ratingService, () {
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
                          'Ваш отзыв',
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'на отель “${widget.hotelDetails.hotel!.name!}”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFE50914),
                          fontSize: 22,
                          fontFamily: 'MullerNarrow',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
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
                            hintText: "Ваш отзыв",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFFE0E0E0)),
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
                      RatingSelect("Соответствие описанию","Добавьте оценку", (rating) {
                        setState(() {
                          ratingInfo = int.parse(rating);
                        });
                      }),
                      RatingSelect("Цена / качество", "Добавьте цену",(rating) {
                        setState(() {
                          ratingPrice = int.parse(rating);
                        });
                      }),
                      RatingSelect("Чистота", "Добавьте чистоты",(rating) {
                        setState(() {
                          ratingClear = int.parse(rating);
                        });
                      }),
                      RatingSelect("Комфорт", "Добавьте комфорта",(rating) {
                        setState(() {
                          ratingComfort = int.parse(rating);
                        });
                      }),
                      RatingSelect("Услуги / Персонал", "Добавьте услуги",(rating) {
                        setState(() {
                          ratingService = int.parse(rating);
                        });
                      }),
                    ],
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
                  child: MyElevatedButton(
                    onPressed: () {
                      if (agree) {
                        addRating();
                      } else {
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Container(
                                child: Text(
                                    "Я даю согласие на обработку персональных данных"),
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

Widget RatingSelect(String text,String btnTitle, void Function(String) onSelected) {
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
          child: AddRatingDropDown(
        list: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        onSelected: onSelected,
            btnTitle:btnTitle ,
      ))
    ],
  );
}
