import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../styles.dart';

class Tile extends StatelessWidget {
  const Tile(
      {Key? key,
      required this.index,
      required this.list,
      required this.reverse,
      this.project = false})
      : super(key: key);
  final int index;
  final dynamic list;
  final bool reverse;
  final bool project;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap:
                list[reverse ? list.length - index - 1 : index]['link'] != null
                    ? () => launch(
                        list[reverse ? list.length - index - 1 : index]['link'])
                    : null,
            child: list[reverse ? list.length - index - 1 : index]['image'] !=
                    null
                ? Image.network(
                    list[reverse ? list.length - index - 1 : index]['image'],
                    height: 48,
                  )
                : SvgPicture.asset(
                    project ? 'light-bulb.svg' : 'building.svg',
                    height: 48,
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.8,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        list[reverse ? list.length - index - 1 : index]
                            ['title'],
                        style: roboto(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(list[reverse ? list.length - index - 1 : index]['place'],
                  style: roboto(fontSize: 18, color: Colors.white38)),
              const SizedBox(
                height: 8,
              ),
              Text(
                  !project
                      ? list[reverse ? list.length - index - 1 : index]
                              ['start_date'] +
                          " - " +
                          list[reverse ? list.length - index - 1 : index]
                              ['end_date']
                      : list[reverse ? list.length - index - 1 : index]
                          ['start_date'],
                  style: roboto(fontSize: 18, color: Colors.white38)),
              list[reverse ? list.length - index - 1 : index]['description'] !=
                      null
                  ? const SizedBox(
                      height: 12,
                    )
                  : Container(),
              list[reverse ? list.length - index - 1 : index]['description'] !=
                      null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: SizedBox(
                        width: constraints.maxWidth * 0.8,
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                  list[reverse
                                      ? list.length - index - 1
                                      : index]['description'],
                                  style: roboto(
                                      fontSize: 18, color: Colors.white54)),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              list[reverse ? list.length - index - 1 : index]
                          ['link_to_project'] !=
                      null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12, left: 8),
                      child: InkWell(
                        onTap: () => launch(
                            list[reverse ? list.length - index - 1 : index]
                                ['link_to_project']),
                        child: Text(
                          list[reverse ? list.length - index - 1 : index]
                              ['link_to_project_text'],
                          style: roboto(fontSize: 18, color: Colors.white54),
                        ),
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 12,
              )
            ],
          )
        ],
      );
    });
  }
}
