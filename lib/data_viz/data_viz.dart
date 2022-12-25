import 'package:flutter/material.dart';
import 'package:time/data_viz/circle/neuomorphic_circle.dart';
import 'package:time/data_viz/progress_ring.dart';
import '../costants.dart';

class DataViz extends StatelessWidget {
  final bevel = 10.0;
  final blurOffset = const Offset(20.0 / 2, 20.0 / 2);

  Color shadowColor = Colors.black87;
  Color backgroundColor = Constants.backgroundColor;
  Color highlightColor = Colors.white.withOpacity(0.05);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width: 50,
        // height: 50,
        child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .95,
                  height: MediaQuery.of(context).size.width * .95,
                  child: NeuomorphicCircle(
                    shadowColor: shadowColor,
                    backgroundColor: backgroundColor,
                    highlightColor: highlightColor,
                    innerShadow: true,
                    outerShadow: false,
                  ),
                ),
                LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    width: constraints.maxWidth * 0.60,
                    height: constraints.maxWidth * 0.60,
                    child: NeuomorphicCircle(
                      innerShadow: false,
                      outerShadow: true,
                      highlightColor: highlightColor,
                      shadowColor: shadowColor,
                      backgroundColor: backgroundColor,
                      child: const SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            // child: Text(
                            //   "14",
                            //   style: TextStyle(
                            //       textBaseline: TextBaseline.alphabetic,
                            //       color: Colors.white60,
                            //       fontWeight: FontWeight.w600),
                            // ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                const ProgressRing(
                  progress: 0.6,
                )
              ],
            )),
      ),
    );
  }
}
