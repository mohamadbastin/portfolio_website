import 'package:flutter/material.dart';
import 'package:portfolio_flutter/styles.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        // width: double.maxFinite,
        // height: constraints.maxHeight * 0.15,
        child: Center(
          child: Column(
            children: [
              Text(
                title,
                style: roboto(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Divider(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
