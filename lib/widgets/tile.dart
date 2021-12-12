import 'package:flutter/material.dart';

import '../styles.dart';

class Tile extends StatelessWidget {
  const Tile(
      {Key? key,
      required this.index,
      required this.list,
      required this.reverse})
      : super(key: key);
  final int index;
  final dynamic list;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          list[reverse ? list.length - index - 1 : index]['image'],
          height: 48,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              list[reverse ? list.length - index - 1 : index]['title'],
              style: roboto(fontSize: 20, color: Colors.white),
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
                list[reverse ? list.length - index - 1 : index]['start_date'] +
                    " - " +
                    list[reverse ? list.length - index - 1 : index]['end_date'],
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
                    child: Text(
                        list[reverse ? list.length - index - 1 : index]
                            ['description'],
                        style: roboto(fontSize: 18, color: Colors.white54)),
                  )
                : Container()
          ],
        )
      ],
    );
  }
}
