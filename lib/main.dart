import 'dart:math';
import 'dart:ui';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
                color: greyMain.withOpacity(0.7),
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
                          child: IntroductionCard(),
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
      return Padding(
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
                  // const SizedBox(width: 10.0),
                  // SizedBox(
                  //   height: 150,
                  //   child: Center(
                  //     child: Text(
                  //       'Developer',
                  //       style: roboto(
                  //           fontSize: 36,
                  //           fontWeight: FontWeight.w500,
                  //           color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
