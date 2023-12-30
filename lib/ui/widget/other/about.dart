import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Контакты',
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
                  child: Expanded(
                    child: Icon(Icons.close),
                    flex: 10,
                  ),
                  onTap: () => {context.pop()},
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Круглосуточное бронирование номеров',
                  style: TextStyle(
                    color: Color(0xFF585858),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '+7 (495) 128-76-77',
                  style: TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 24,
                    fontFamily: 'MullerNarrow',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '+7 (495) 975-93-67',
                  style: TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 24,
                    fontFamily: 'MullerNarrow',
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Контент-менеджер (размещение информации объекта размещения)',
                  style: TextStyle(
                    color: Color(0xFF585858),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'E-mail:',
                      style: TextStyle(
                        color: Color(0xFF585858),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'support@60minut.ru',
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 24,
                        fontFamily: 'MullerNarrow',
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'WhatsApp:',
                      style: TextStyle(
                        color: Color(0xFF585858),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '+7 (927) 195-51-84',
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontSize: 24,
                        fontFamily: 'MullerNarrow',
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Реклама и сотрудничество (10:00 - 19:00)',
                  style: TextStyle(
                    color: Color(0xFF585858),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '+7 (495) 240-86-84',
                  style: TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 24,
                    fontFamily: 'MullerNarrow',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Московский офис и адрес для писем',
                  style: TextStyle(
                    color: Color(0xFF585858),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  '129164, г.Москва, ул. Ярославская, д.8, к.7, офис 5',
                  style: TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () => {},
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFF5F5F5))),
                        child: SvgPicture.asset("assets/icons/envelope.svg"))),
                SizedBox(width: 8,),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () => {},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                            MaterialStateProperty.all(Color(0xFFF5F5F5))),
                        child: SvgPicture.asset("assets/icons/skype.svg"))),
                SizedBox(width: 8,),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () => {},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                            MaterialStateProperty.all(Color(0xFFF5F5F5))),
                        child: SvgPicture.asset("assets/icons/vk.svg"))),
                SizedBox(width: 8,),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () => {},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                            MaterialStateProperty.all(Color(0xFFF5F5F5))),
                        child: SvgPicture.asset("assets/icons/facebook-f.svg"))),
                SizedBox(width: 8,),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () => {},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                            MaterialStateProperty.all(Color(0xFFF5F5F5))),
                        child: SvgPicture.asset("assets/icons/twitter.svg")))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                onPressed: () => {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 40)),
                    backgroundColor:
                    MaterialStateProperty.all(Color(0xFFF5F5F5))),
                child: Text(
                  'Обратная связь',
                  style: TextStyle(
                    color: Color(0xFF2F2F2F),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
