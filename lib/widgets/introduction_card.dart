import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles.dart';
import 'contact_button.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 3.5,
              center: Alignment(-0.2, -0.4),
              colors: [Color(0xff1D1E21), Color(0xff313438)],
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(42), bottomLeft: Radius.circular(42))),
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: Padding(
          padding: EdgeInsets.only(
            top: constraints.maxHeight * 0.072,
            left: constraints.maxWidth * 0.112,
            // right: constraints.maxWidth * 0.05
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/logo.svg',
                height: constraints.maxHeight * 0.058,
                width: constraints.maxWidth * 0.098,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(top: constraints.maxHeight * 0.217),
                child: Text("Hi I'm",
                    style: roboto(
                        fontSize: 48,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ),
              Padding(
                padding: EdgeInsets.only(top: constraints.maxHeight * 0.039),
                child: Text("Mohamad Bastin",
                    style: roboto(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
              ),
              Padding(
                padding: EdgeInsets.only(top: constraints.maxHeight * 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DefaultTextStyle(
                      style: roboto(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      child: SizedBox(
                        height: 150,
                        child: Center(
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              RotateAnimatedText('Flutter Developer',
                                  rotateOut: false,
                                  duration: const Duration(milliseconds: 600)),
                              RotateAnimatedText('Backend Developer',
                                  rotateOut: false,
                                  duration: const Duration(milliseconds: 600)),
                              RotateAnimatedText('Frontend Developer',
                                  rotateOut: false,
                                  duration: const Duration(milliseconds: 600)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: constraints.minHeight * 0.024),
                child: const ContactButton(),
              )
            ],
          ),
        ),
      );
    });
  }
}
