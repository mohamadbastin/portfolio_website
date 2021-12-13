import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/get_data.dart';
import 'package:portfolio_flutter/widgets/tile.dart';
import 'package:portfolio_flutter/widgets/title_bar.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [TitleBar(title: "Projects"), ProjectCard()],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Expanded(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 28),
            child: Column(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: GetData.projectData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          children: [
                            Tile(
                              index: index,
                              list: GetData.projectData,
                              reverse: true,
                              project: true,
                            ),
                            const Divider(
                              indent: 100,
                              endIndent: 200,
                              thickness: 1,
                              color: Colors.white38,
                            )
                          ],
                        ),
                      );
                    }),
                const SizedBox(
                  height: 150,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
