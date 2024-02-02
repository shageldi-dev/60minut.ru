import 'package:booking/features/home/models/detail_model.dart';
import 'package:booking/features/home/models/hotel_details/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Ratings extends StatefulWidget {
   const Ratings({super.key,required this.hotelDetails});
   final HotelDetails hotelDetails;
  @override
  State<Ratings> createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(flex: 90,child:Text(
                  'Отзывы',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 24,
                    fontFamily: 'MullerNarrow',
                    fontWeight: FontWeight.w800,
                  ),
                ),),
                GestureDetector(child: const Icon(Icons.close), onTap: ()=>{context.pop()},)
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'на отель “${widget.hotelDetails.hotel!.name}”',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFE50914),
                    fontSize: 22,
                    fontFamily: 'MullerNarrow',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/star.svg"),
              const SizedBox(width: 12,),
              Text(
              widget.hotelDetails.hotel!.ratingTotal ?? '8.5',
                style: const TextStyle(
                  color: Color(0xFF2F2F2F),
                  fontSize: 24,
                  fontFamily: 'MullerNarrow',
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 12,),
              Text(
                '${widget.hotelDetails.reviews!.length} отзывов',
                style: const TextStyle(
                  color: Color(0xFF2F2F2F),
                  fontSize: 24,
                  fontFamily: 'MullerNarrow',
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                RatingProgress("Соответствие инфо", double.parse(widget.hotelDetails.hotel!.ratingInfo??'0'), [const Color(0xFF484848), const Color(0xFFFF595E)], Colors.white),
                const SizedBox(height: 8,),
                RatingProgress("Сена / Кацество", double.parse(widget.hotelDetails.hotel!.ratingPrice ??'0'), [const Color(0xFF484848), const Color(0xFFFF595E)], Colors.white),
                const SizedBox(height: 8,),
                RatingProgress("Чистота", double.parse(widget.hotelDetails.hotel!.ratingClear ??'0'), [const Color(0xFF484848), const Color(0xFFFF595E)], Colors.white),
                const SizedBox(height: 8,),
                RatingProgress(" Комфорт", double.parse(widget.hotelDetails.hotel!.ratingComfort ??'0'), [const Color(0xFF484848), const Color(0xFFFF595E)], Colors.white),
                const SizedBox(height: 8,),
                RatingProgress("Услуги / Личное", double.parse(widget.hotelDetails.hotel!.ratingManual ??'0'), [const Color(0xFF484848), const Color(0xFFFF595E)], Colors.white),
              //  SizedBox(height: 8,),
              //  RatingProgress("Соответствие инфо", 9, [Color(0xFF484848), Color(0xFFFF595E)], Colors.white),

              ],
            ),
          ),
          widget.hotelDetails.reviews !=null ?  Container(

            height:widget.hotelDetails.reviews!.length < 3 ? widget.hotelDetails.reviews!.length * 500 : widget.hotelDetails.reviews!.length * 460 ,
            padding: const EdgeInsets.all(16.0),

            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.hotelDetails.reviews!.length,
                itemBuilder: (context, index){

                MapEntry<String, Review>?  reviewEntry = widget.hotelDetails.reviews!.entries.elementAt(index);
                Review? review = reviewEntry.value;
              return Container(
                padding: const EdgeInsets.only(bottom: 12),
                child: RatingItem(review.text!??'',
                    review.name!??'',
                    review.date!??"",

                  RatingItem("", "", "", Column(
                    children: [
                      RatingProgress("Соответствие инфо", double.parse(review.ratingInfo ?? '0'), [const Color(0xFFE7E7E7),const Color(0xFFFF595E)], const Color(0xFF2F2F2F)),
                      const SizedBox(height: 12,),
                      RatingProgress("Сена / Кацество", double.parse(review.ratingPrice ?? '0'), [const Color(0xFFE7E7E7),const Color(0xFFFF595E)], const Color(0xFF2F2F2F)),
                      const SizedBox(height: 12,),
                      RatingProgress("Чистота", double.parse(review.ratingClear ?? '0'), [const Color(0xFFE7E7E7),const Color(0xFFFF595E)], const Color(0xFF2F2F2F)),
                      const SizedBox(height: 12,),
                      RatingProgress("Комфорт", double.parse(review.ratingComfort ?? '0'), [const Color(0xFFE7E7E7),const Color(0xFFFF595E)], const Color(0xFF2F2F2F)),
                      const SizedBox(height: 12,),
                      RatingProgress("Услуги / Личное", double.parse(review.ratingService ?? '0'), [const Color(0xFFE7E7E7),const Color(0xFFFF595E)], const Color(0xFF2F2F2F)),

                    ],
                  )),
                ),
              );
            })


            // Column(
            //   children: [1,2,3,4,5,6,7,].map((e) =>
            //       Padding(
            //         padding: const EdgeInsets.only(bottom: 12),
            //         child: RatingItem("", "", "", Column(
            //           children: [
            //             RatingProgress("Соответствие инфо", 8, [Color(0xFFE7E7E7),Color(0xFFFF595E)], Color(0xFF2F2F2F)),
            //             SizedBox(height: 12,),
            //             RatingProgress("Соответствие инфо", 7, [Color(0xFFE7E7E7),Color(0xFFFF595E)], Color(0xFF2F2F2F)),
            //             SizedBox(height: 12,),
            //             RatingProgress("Соответствие инфо", 3, [Color(0xFFE7E7E7),Color(0xFFFF595E)], Color(0xFF2F2F2F)),
            //             SizedBox(height: 12,),
            //             RatingProgress("Соответствие инфо", 4, [Color(0xFFE7E7E7),Color(0xFFFF595E)], Color(0xFF2F2F2F)),
            //             SizedBox(height: 12,),
            //             RatingProgress("Соответствие инфо", 10, [Color(0xFFE7E7E7),Color(0xFFFF595E)], Color(0xFF2F2F2F)),
            //
            //           ],
            //         )),
            //       )
            //   ).toList(),
            // ),
          ) : Container()
        ],
      ),
    );
  }
}

Widget RatingItem(String text, String name, String date, Widget content){
  return Container(
    width: double.infinity,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xFF2F2F2F),
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                date,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Color(0xFF585858),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF2F2F2F),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          content
        ],
      ),
    ),
  );
}

Widget RatingProgress(String title, double value, List<Color> colors, Color textColor){
  return Container(
    width: double.infinity,
    alignment: Alignment.centerLeft,
    height: 34,
    decoration: ShapeDecoration(
      color: const Color(0xFF484848),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    child: FractionallySizedBox(
      widthFactor: value/10,
      child: Container(
        width: double.infinity,
        height: 34,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-1.00, -0.00),
            end: const Alignment(1, 0),
            colors: colors,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  value.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ) ,
  );
}
