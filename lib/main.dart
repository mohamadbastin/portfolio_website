import 'dart:math';
import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          opacity: 0.7,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Card(
                elevation: 10,
                color: greyMain.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 4, color: Colors.white),
                    borderRadius: BorderRadius.circular(42)),
                child: const Center(
                  child: Text("data"),
                )),
          ),
        ),
      );
    });
  }
}
