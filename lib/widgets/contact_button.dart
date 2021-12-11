import 'package:flutter/material.dart';

import '../styles.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return InkWell(
        onTap: () {
          showDialog(context: context, builder: (context) => const Contact());
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
      
    );
  }
}
