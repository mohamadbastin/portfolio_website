import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_flutter/styles.dart';

class TabFloater extends StatefulWidget {
  const TabFloater({Key? key, required this.tabs}) : super(key: key);

  final List<TabSection> tabs;

  @override
  _TabFloaterState createState() => _TabFloaterState();
}

class _TabFloaterState extends State<TabFloater> {
  int _selected = 0;
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          width: constraints.maxWidth * 0.729,
          height: constraints.maxWidth * 0.075,
          decoration: BoxDecoration(
              color: const Color(0xff19181B).withOpacity(0.9),
              borderRadius: BorderRadius.circular(36)),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: widget.tabs.length,
                  itemBuilder: (buildContext, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 32.0, right: 16),
                      child: SizedBox(
                        height: double.maxFinite,
                        // width: 100,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              _selected = index;
                              widget.tabs[index].onTap();
                            },
                            child: Text(
                              widget.tabs[index].title,
                              style: roboto(
                                  fontSize: 18,
                                  color: _selected == index
                                      ? myPurple
                                      : Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ));
    });
  }
}

class TabSection {
  const TabSection(this.title, this.onTap);

  final String title;
  final void Function() onTap;
}
