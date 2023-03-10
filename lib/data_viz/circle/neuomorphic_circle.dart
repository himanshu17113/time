import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'circle_inner_highlight.dart';
import 'circle_inner_shadow.dart';

class NeuomorphicCircle extends StatelessWidget {
  final bool innerShadow;
  final bool outerShadow;
  final Color highlightColor;
  final Color shadowColor;
  final Color backgroundColor;
  final Widget child;

  const NeuomorphicCircle(
      {Key? key,
      required this.innerShadow,
      required this.outerShadow,
      required this.highlightColor,
      required this.shadowColor,
      required this.backgroundColor,
      this.child = const SizedBox.shrink()})
      : super(key: key);
  // child = child : SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(alignment: Alignment.center, children: [
        Container(
          // width: 50,
          // height: 50,
          decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              boxShadow: (outerShadow)
                  ? [
                      BoxShadow(
                          color: highlightColor,
                          offset: Offset(-10, -10),
                          blurRadius: 20,
                          spreadRadius: 0),
                      BoxShadow(
                          color: shadowColor,
                          offset: Offset(10, 10),
                          blurRadius: 20,
                          spreadRadius: 0)
                    ]
                  : null),
          // width: 50,
          // height: 50,
        ),
        (innerShadow)
            ? ClipPath(
                clipper: HighlightClipper(),
                child: CircleInnerHighlight(
                  highlightColor: highlightColor,
                  backgroundColor: backgroundColor,
                ))
            : SizedBox.shrink(),
        (innerShadow)
            ? ClipPath(
                clipper: ShadowClipper(),
                child: CircleInnerShadow(
                  shadowColor: shadowColor,
                  backgroundColor: backgroundColor,
                ),
              )
            : SizedBox.shrink(),
        (child != null) ? child : SizedBox.shrink(),
        Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Lottie.asset(
              'assets/breath3.json',
            )),
      ]),
    );
  }
}

class HighlightClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }
}
