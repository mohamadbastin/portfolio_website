import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/top_card.dart';

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
