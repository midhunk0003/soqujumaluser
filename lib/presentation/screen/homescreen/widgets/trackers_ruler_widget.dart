import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:customersouqjumla/presentation/screen/homescreen/widgets/tracker_ruler_widget_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TrackersRulerWidget extends StatefulWidget {
  const TrackersRulerWidget(
      {Key? key,
      required this.max,
      required this.min,
      required this.unitsMeasurement,
      required this.selectValue,
      required this.onChanged})
      : super(key: key);

  final int max;
  final int min;
  final String unitsMeasurement;
  final num selectValue;
  final ValueChanged<num> onChanged;

  @override
  _TrackersRulerWidgetState createState() => _TrackersRulerWidgetState();
}

class _TrackersRulerWidgetState extends State<TrackersRulerWidget> {
  int _count = 0;
  String _value = "";
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    Timer(Duration(milliseconds: 300), () {
      _scrollDown();
    });
    _count = widget.max;
    _scrollController.addListener(_lodeMoreData);
    super.didChangeDependencies();
  }

  void _scrollDown() {
    final scrollTo =
        ((widget.selectValue.toDouble() - widget.min) / (_count - widget.min)) *
            _scrollController.position.maxScrollExtent;

    _scrollController.animateTo(
      scrollTo,
      duration: const Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _lodeMoreData() async {
    final newValue = ((_scrollController.position.pixels /
                _scrollController.position.maxScrollExtent) *
            (_count - widget.min)) +
        widget.min;

    setState(() {
      _value = newValue.toStringAsFixed(1);
    });

    widget.onChanged(newValue);
    print(_value);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // Adjust container height and padding based on screen width
    final containerHeight = width > 600 ? 120.0 : 95.5;
    final sidePadding = width / 2.03 - 2;
    final sidePaddingtablet = width / 2.615 - 2;
    return LayoutBuilder(builder: (context, constraints) {
      bool isTbalet = constraints.maxWidth > 600;
      return Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            // color: const Color.fromRGBO(255, 255, 255, 1),
            height: containerHeight,
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                left: isTbalet ? sidePaddingtablet : sidePadding,
                right: isTbalet ? sidePaddingtablet : sidePadding,
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: List.generate(
                          10,
                          (index) {
                            final value = ((_count / 10) * index).toInt();
                            return Stack(
                              children: [
                                TrackerRulerWidgetItem(
                                  value: value,
                                  index: index,
                                  isLast: _count == (_count / 10) * (index + 1),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    // Row(
                    //   children: List.generate(
                    //     11,
                    //     (index) {
                    //       final value = ((_count / 10) * index).toInt();
                    //       final valueWidth =
                    //           ((_count / 10) * (index + 1)).toInt();
                    //       return SizedBox(
                    //         width: index > 9
                    //             ? valueWidth.toString().length * 12
                    //             : (90 -
                    //                 (index == 0 &&
                    //                             valueWidth.toString().length > 1
                    //                         ? valueWidth.toString().length * 3
                    //                         : 0)
                    //                     .toDouble()),
                    //         child: Row(
                    //           children: [Text("${value.toString()}")],
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          ),

          ///////
          Column(
            children: [
              Container(
                height: isTbalet ? 120 : 70,
                width: 2,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
              ),
              Text(
                widget.unitsMeasurement,
              )
            ],
          )
        ],
      );
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_lodeMoreData);
    _scrollController.dispose();
    super.dispose();
  }
}
