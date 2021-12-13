import 'package:flutter/material.dart';
import 'package:portfolio_flutter/widgets/about_page.dart';
import 'package:portfolio_flutter/widgets/experience_page.dart';
import 'package:portfolio_flutter/widgets/project_page.dart';
import 'package:portfolio_flutter/widgets/tab_floater.dart';

class DetailCard extends StatefulWidget {
  const DetailCard({Key? key}) : super(key: key);

  @override
  _DetailCardState createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  List<Widget> pages = [];
  List<TabSection> tabs = [];
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    pages = const [AboutPage(), ExperiencePage(), ProjectPage()];
    tabs = [
      TabSection("ABOUT", () {
        setMyState(0);
      }),
      TabSection("EXPERIENCE", () {
        setMyState(1);
      }),
      TabSection("PROJECTS", () {
        setMyState(2);
      }),
    ];
  }

  void setMyState(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: pages[_selectedPage],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 34),
              child: TabFloater(
                tabs: tabs,
              ),
            ),
          )
        ],
      );
    });
  }
}
