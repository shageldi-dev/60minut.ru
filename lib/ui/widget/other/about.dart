import 'package:booking/utils/call/call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'contact_us.dart';

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
                const Expanded(
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
                  child: const Icon(Icons.close),
                  onTap: () => {context.pop()},
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Круглосуточное бронирование номеров',
                  style: TextStyle(
                    color: Color(0xFF585858),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: (){
                    makePhoneCall('+7 (495) 128-76-77', context);
                  },
                  child: const Text(
                    '+7 (495) 128-76-77',
                    style: TextStyle(
                      color: Color(0xFF2F2F2F),
                      fontSize: 24,
                      fontFamily: 'MullerNarrow',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(onTap: (){
                  makePhoneCall('+7 (495) 975-93-67', context);
                },
                  child: const Text(
                    '+7 (495) 975-93-67',
                    style: TextStyle(
                      color: Color(0xFF2F2F2F),
                      fontSize: 24,
                      fontFamily: 'MullerNarrow',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Контент-менеджер (размещение информации объекта размещения)',
                  style: TextStyle(
                    color: Color(0xFF585858),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'E-mail:',
                      style: TextStyle(
                        color: Color(0xFF585858),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        openUrlOnWeb('support@60minut.ru');
                      },
                      child: const Text(
                        'support@60minut.ru',
                        style: TextStyle(
                          color: Color(0xFF2F2F2F),
                          fontSize: 24,
                          fontFamily: 'MullerNarrow',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'WhatsApp:',
                      style: TextStyle(
                        color: Color(0xFF585858),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        openWhatsApp('+7 (927) 195-51-84');
                      },
                      child: const Text(
                        '+7 (927) 195-51-84',
                        style: TextStyle(
                          color: Color(0xFF2F2F2F),
                          fontSize: 24,
                          fontFamily: 'MullerNarrow',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Реклама и сотрудничество (10:00 - 19:00)',
                  style: TextStyle(
                    color: Color(0xFF585858),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: (){
                    makePhoneCall('+7 (495) 240-86-84', context);
                  },
                  child: const Text(
                    '+7 (495) 240-86-84',
                    style: TextStyle(
                      color: Color(0xFF2F2F2F),
                      fontSize: 24,
                      fontFamily: 'MullerNarrow',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
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
                                MaterialStateProperty.all(const Color(0xFFF5F5F5))),
                        child: SvgPicture.asset("assets/icons/envelope.svg"))),
                const SizedBox(width: 8,),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () => {
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFF5F5F5))),
                        child: SvgPicture.asset("assets/icons/skype.svg"))),
                const SizedBox(width: 8,),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () => {
                          openVK()
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFF5F5F5))),
                        child: SvgPicture.asset("assets/icons/vk.svg"))),
                const SizedBox(width: 8,),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () => {openFacebook()},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFF5F5F5))),
                        child: SvgPicture.asset("assets/icons/facebook-f.svg"))),
                const SizedBox(width: 8,),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () => {openTwitter()},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFF5F5F5))),
                        child: SvgPicture.asset("assets/icons/twitter.svg")))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                onPressed: () => {
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    useRootNavigator: true,
                    builder: (BuildContext context) {
                      return const ContactUs();
                    },
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(12))),
                  )
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 40)),
                    backgroundColor:
                    MaterialStateProperty.all(const Color(0xFFF5F5F5))),
                child: const Text(
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
