import 'package:booking/ui/widget/home/actions/filter/filter_by_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Ratings extends StatefulWidget {
  const Ratings({super.key});

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
                Expanded(child:Text(
                  'Отзывы',
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'на отель “Ампир”',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFE50914),
                  fontSize: 22,
                  fontFamily: 'MullerNarrow',
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/star.svg"),
              SizedBox(width: 12,),
              Text(
                '9.5',
                style: TextStyle(
                  color: Color(0xFF2F2F2F),
                  fontSize: 24,
                  fontFamily: 'MullerNarrow',
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(width: 12,),
              Text(
                '12 отзывов',
                style: TextStyle(
                  color: Color(0xFF2F2F2F),
                  fontSize: 24,
                  fontFamily: 'MullerNarrow',
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                RatingProgress("Соответствие инфо", 9.7, [Color(0xFF484848), Color(0xFFFF595E)], Colors.white),
                SizedBox(height: 8,),
                RatingProgress("Соответствие инфо", 9, [Color(0xFF484848), Color(0xFFFF595E)], Colors.white),
                SizedBox(height: 8,),
                RatingProgress("Соответствие инфо", 9, [Color(0xFF484848), Color(0xFFFF595E)], Colors.white),
                SizedBox(height: 8,),
                RatingProgress("Соответствие инфо", 9, [Color(0xFF484848), Color(0xFFFF595E)], Colors.white),
                SizedBox(height: 8,),
                RatingProgress("Соответствие инфо", 9, [Color(0xFF484848), Color(0xFFFF595E)], Colors.white),
                SizedBox(height: 8,),
                RatingProgress("Соответствие инфо", 9, [Color(0xFF484848), Color(0xFFFF595E)], Colors.white),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [1,2,3,4,5,6,7,].map((e) =>
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: RatingItem("", "", "", Column(
                      children: [
                        RatingProgress("Соответствие инфо", 8, [Color(0xFFE7E7E7),Color(0xFFFF595E)], Color(0xFF2F2F2F)),
                        SizedBox(height: 12,),
                        RatingProgress("Соответствие инфо", 7, [Color(0xFFE7E7E7),Color(0xFFFF595E)], Color(0xFF2F2F2F)),
                        SizedBox(height: 12,),
                        RatingProgress("Соответствие инфо", 3, [Color(0xFFE7E7E7),Color(0xFFFF595E)], Color(0xFF2F2F2F)),
                        SizedBox(height: 12,),
                        RatingProgress("Соответствие инфо", 4, [Color(0xFFE7E7E7),Color(0xFFFF595E)], Color(0xFF2F2F2F)),
                        SizedBox(height: 12,),
                        RatingProgress("Соответствие инфо", 10, [Color(0xFFE7E7E7),Color(0xFFFF595E)], Color(0xFF2F2F2F)),

                      ],
                    )),
                  )
              ).toList(),
            ),
          )
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
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Николай',
                style: TextStyle(
                  color: Color(0xFF2F2F2F),
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '16 августа 2023',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF585858),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          SizedBox(height: 16,),
          Text(
            'В районе Печатники вы можете отлично провести время вдвоем в одной из недорогих гостиниц. Отель Ампир в Москве отличается приемлемой ценовой категорий, на 2-3 часа здесь можно остановиться абсолютно без ущерба для своего кошелька. Это хорошее решение и для отдыха на всю ночь. Можно побыть только вдвоем, отвлечься от хлопот и забот.',
            style: TextStyle(
              color: Color(0xFF2F2F2F),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16,),
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
      color: Color(0xFF484848),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    child: FractionallySizedBox(
      widthFactor: value/10,
      child: Container(
        width: double.infinity,
        height: 34,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.00, -0.00),
            end: Alignment(1, 0),
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
                  'Соответствие инфо',
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
                  style: TextStyle(
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
