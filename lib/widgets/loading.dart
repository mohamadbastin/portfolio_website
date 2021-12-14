import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_flutter/styles.dart';

class CustomLoadingIndicator extends StatefulWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  State<CustomLoadingIndicator> createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator>
// with SingleTickerProviderStateMixin
{
  // late AnimationController controller;
  // late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    // controller =
    //     AnimationController(vsync: this, duration: const Duration(seconds: 2));
    // sizeAnimation = Tween<double>(begin: 100.0, end: 300.0).animate(controller);

    // controller.addListener(() {
    //   setState(() {});
    // });
  }

  final someColor = const Color(0xff4a4a4a);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyMain,
      body: Center(
        child: Lottie.asset('assets/logo.json', width: 500, height: 500),
      ),
    );
  }
}
