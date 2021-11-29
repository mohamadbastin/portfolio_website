import 'dart:ui';
import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mohamad Bastin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: greyMain,
          child: Stack(
            // fit: StackFit.expand,
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: SvgPicture.asset("assets/eclipse.svg")),
              const TopCard(),
            ],
          )),
    );
  }
}

class TopCard extends StatelessWidget {
  const TopCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SizedBox(
        height: constraints.maxHeight * 0.89,
        width: constraints.maxWidth * 0.93,
        child: Opacity(
          opacity: 1,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Card(
                elevation: 10,
                color: greyTopCard.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 4, color: Colors.white),
                    borderRadius: BorderRadius.circular(42)),
                child: LayoutBuilder(builder:
                    (BuildContext context2, BoxConstraints constraints2) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: double.maxFinite,
                        width: constraints2.maxWidth * 0.38,
                        child: Container(
                          color: Colors.transparent,
                          child: const IntroductionCard(),
                        ),
                      ),
                      SizedBox(
                        height: double.maxFinite,
                        width: constraints2.maxWidth * 0.62,
                        child: Container(
                          color: Colors.transparent,
                        ),
                      )
                    ],
                  );
                })),
          ),
        ),
      );
    });
  }
}

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

class ContactButton extends StatelessWidget {
  const ContactButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SizedBox(
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
      );
    });
  }
}
