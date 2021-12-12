import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/styles.dart';
import 'package:portfolio_flutter/utils/get_data.dart';
import 'package:portfolio_flutter/widgets/tile.dart';
import 'package:portfolio_flutter/widgets/title_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const TitleBar(title: "About"), AboutCard()],
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  AboutCard({Key? key}) : super(key: key);
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Expanded(
        child: SingleChildScrollView(
          controller: _controller,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                GetData.aboutPageData!['name'],
                style: roboto(color: Colors.white, fontSize: 36),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Text(
                  GetData.aboutPageData!['bio'],
                  style: roboto(color: Colors.white, fontSize: 26),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
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
                padding: const EdgeInsets.only(top: 18.0),
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
                padding: const EdgeInsets.only(top: 28.0, left: 58, right: 58),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: SvgPicture.asset(
                        "linkedin.svg",
                        height: 48,
                      ),
                      onTap: () => launch(GetData.aboutPageData!['linkedin']),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: SvgPicture.asset(
                        "github.svg",
                        height: 48,
                      ),
                      onTap: () => launch(GetData.aboutPageData!['github']),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: SvgPicture.asset(
                        "stack-overflow.svg",
                        height: 48,
                      ),
                      onTap: () =>
                          launch(GetData.aboutPageData!['stackoverflow']),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Text(
                  "Education:",
                  style: roboto(color: Colors.white, fontSize: 24),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 18.0, left: 28, bottom: 200),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: GetData.aboutPageData!['education'].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 28.0),
                      child: Tile(
                        list: GetData.aboutPageData!['education'],
                        index: index,
                        reverse: true,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
