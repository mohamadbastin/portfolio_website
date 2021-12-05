import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_flutter/widgets/detail_card.dart';

import '../styles.dart';
import 'introduction_card.dart';

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
                          child: const DetailCard(),
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
