// import 'package:flutter/material.dart';
// class GridTableThingy extends StatefulWidget {
//   const GridTableThingy(
//       {Key? key,
//       required this.rows,
//       required this.columns,
//       this.debug = false,
//       required this.children})
//       : super(key: key);

//   final int rows;
//   final int columns;
//   final bool debug;
//   final List<BubbleItem> children;

//   @override
//   _GridTableThingyState createState() => _GridTableThingyState();
// }

// class _GridTableThingyState extends State<GridTableThingy> {
//   List colors = [
//     Colors.red,
//     Colors.green,
//     // Colors.yellow,
//     Colors.blue,
//     // Colors.cyan,
//     Colors.orange,
//     Colors.grey,
//     Colors.lime,
//     Colors.pink,
//     Colors.purple,
//     // Colors.teal,
//     Colors.white,
//     // Colors.transparent
//   ];
//   Random random = Random();

//   int randomColor() {
//     return random.nextInt(colors.length);
//   }

//   List<double> _getCellSize() {
//     var width = (MediaQuery.of(context).size.width) / widget.columns;
//     var height = (MediaQuery.of(context).size.height) / widget.rows;

//     var ls = [height, width];
//     // print(ls);
//     return ls;
//   }

//   Widget _getChild(row, col) {
//     for (BubbleItem i in widget.children) {
//       // print(i.row);
//       if (i.row == row && i.column == col) {
//         return i.child;
//       }
//     }
//     if (widget.debug) {
//       return Text("$row  $col");
//     }
//     return const Text("");
//   }

//   List<Widget> _createCells(height, width) {
//     List<Widget> cells = [];
//     for (int i = 0; i < widget.rows; i++) {
//       for (int j = 0; j < widget.columns; j++) {
//         cells.add(SizedBox(
//           height: height,
//           width: width,
//           child: Container(
//             color: widget.debug ? colors[randomColor()] : Colors.transparent,
//             child: Center(child: _getChild(i, j)),
//           ),
//         ));
//       }
//     }

//     return cells;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = _getCellSize();
//     var cellHeight = size[0];
//     var cellWidth = size[1];
//     return GridView.count(
//       crossAxisCount: widget.columns,
//       childAspectRatio: cellWidth / cellHeight,
//       children: _createCells(cellHeight, cellWidth),
//     );
//   }
// }

// class BubbleItem extends StatefulWidget {
//   const BubbleItem(
//       {Key? key, required this.row, required this.column, required this.child})
//       : super(key: key);

//   final int row;
//   final int column;
//   final Widget child;

//   @override
//   _BubbleItemState createState() => _BubbleItemState();
// }

// class _BubbleItemState extends State<BubbleItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class FlareItem extends StatefulWidget {
//   const FlareItem({Key? key, required this.child}) : super(key: key);

//   final Widget child;

//   @override
//   _FlareItemState createState() => _FlareItemState();
// }

// class _FlareItemState extends State<FlareItem> {
//   List flares = [
//     "animations/blue.flr",
//     "animations/green.flr",
//     "animations/grey.flr",
//     "animations/red.flr",
//     "animations/yellow.flr"
//   ];

//   Random random = Random();

//   int randomFlare() {
//     return random.nextInt(flares.length);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.loose,
//       alignment: AlignmentDirectional.center,
//       // clipBehavior: ,
//       children: [
//         FlareActor(
//           flares[randomFlare()],
//           animation: "Alarm",
//         ),
//         widget.child
//       ],
//     );
//   }
// }

// const GridTableThingy(
//                 debug: true,
//                 rows: 7,
//                 columns: 12,
//                 children: [
//                   BubbleItem(
//                     row: 3,
//                     column: 1,
//                     child: SizedBox(
//                       // height: 20,
//                       child: Text(
//                         "mamad",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   BubbleItem(
//                     row: 2,
//                     column: 10,
//                     child: FlareItem(
//                         child: Icon(
//                       Icons.airplanemode_on,
//                       color: Colors.white,
//                     )),
//                   ),
//                   BubbleItem(
//                     row: 5,
//                     column: 0,
//                     child: FlareItem(child: Icon(Icons.media_bluetooth_on)),
//                   )
//                 ],
//               ),
