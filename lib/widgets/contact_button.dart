import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/utils/get_data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../styles.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                    content: Contact(),
                    contentPadding: EdgeInsets.all(0),
                    backgroundColor: Colors.transparent,
                  ));
        },
        child: SizedBox(
          height: constraints.maxWidth * 0.17,
          width: constraints.maxWidth * 0.693,
          child: Container(
            decoration: BoxDecoration(
                gradient: const RadialGradient(
                  radius: 2.5,
                  center: Alignment(-0.4, 0),
                  colors: [Color(0xffFFAEA3), Color(0xff59E1FF)],
                ),
                borderRadius: BorderRadius.circular(28)),
            child: Center(
              child: Text(
                "Contact Me",
                style: roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 36,
                    color: const Color(0xff27292C)),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          color: greyTopCard,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(color: Colors.white, width: 3)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 80),
              child: Row(
                children: [
                  const Icon(
                    Icons.phone,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    GetData.aboutPageData!['phone'],
                    style: roboto(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 80),
              child: Row(
                children: [
                  const Icon(
                    Icons.mail,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    GetData.aboutPageData!['email'],
                    style: roboto(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 68.0, left: 58, right: 58),
              child: Wrap(
                runSpacing: 20,
                spacing: 40,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      "assets/linkedin.svg",
                      height: 48,
                    ),
                    onTap: () => launch(GetData.aboutPageData!['linkedin']),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: SvgPicture.asset(
                      "assets/github.svg",
                      height: 48,
                    ),
                    onTap: () => launch(GetData.aboutPageData!['github']),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: SvgPicture.asset(
                      "assets/stack-overflow.svg",
                      height: 48,
                    ),
                    onTap: () =>
                        launch(GetData.aboutPageData!['stackoverflow']),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: SvgPicture.asset(
                      'assets/instagram.svg',
                      height: 58,
                    ),
                    onTap: () => launch(GetData.aboutPageData!['instagram']),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: InkWell(
                      child: SvgPicture.asset(
                        'assets/telegram.svg',
                        height: 38,
                      ),
                      onTap: () => launch(GetData.aboutPageData!['telegram']),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 10),
                    child: InkWell(
                      child: SvgPicture.asset(
                        'assets/whatsapp.svg',
                        height: 38,
                      ),
                      onTap: () => launch(GetData.aboutPageData!['whatsapp']),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
