import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneSelectorDialog extends StatelessWidget {
  final List<String> phones;
  const PhoneSelectorDialog({super.key, required this.phones});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: LayoutBuilder(builder: (context, constrainst) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: constrainst.maxHeight * 0.6),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: phones.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  makePhoneCall(phones[index], context);
                  Navigator.pop(context);
                },
                child: ListTile(
                  // leading: const Icon(
                  //   HeroiconsOutline.phone,
                  //   size: 22,
                  // ),
                  title: Text(phones[index]),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

makePhoneCall(String phone, BuildContext context) async {
  if (phone.contains(',')) {
    List<String> phones = phone.split(',');

    if (phones.isNotEmpty) {
      for (int i = 0; i < phones.length; i++) {
        phones[i] = phones[i].trim();
      }
      showDialog(
        context: context,
        builder: (context) => PhoneSelectorDialog(phones: phones),
      );
      return;
    }
  }

  if (await canLaunchUrl(Uri(scheme: 'tel', path: phone))) {
    launchUrl(Uri(scheme: 'tel', path: phone));
  }
}

void openWhatsApp(String phoneNumber) async {
  // Replace '1234567890' with the phone number you want to open in WhatsApp
  //String phoneNumber = '1234567890';

  // The URL scheme for WhatsApp
  String url = '$phoneNumber';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

openUrlOnWeb(String? url) async {
  try {
    Uri? uri = Uri.tryParse(url ?? '');
    if (uri != null && await canLaunchUrl(uri)) {
      launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}

void openGmail() async {
  String email = 'example@gmail.com'; // Replace with the desired email address
  String subject = 'Subject'; // Optional: Replace with the desired subject
  String body = 'Message Body'; // Optional: Replace with the desired email body

  String url = 'mailto:$email?subject=$subject&body=$body';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

void openSkype() async {
  String username = 'skypeusername'; // Replace with the desired Skype username

  String url = 'skype:$username?chat';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

void openVK() async {
  String userId = '123456789'; // Replace with the desired VK user ID

  String url = 'https://vk.com';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

void openFacebook() async {
  //String username = 'facebookusername'; // Replace with the desired Facebook username

  String url = 'https://www.facebook.com';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

void openTwitter() async {
  String username =
      'twitterusername'; // Replace with the desired Twitter username

  String url = 'https://twitter.com';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}
