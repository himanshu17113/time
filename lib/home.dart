import 'package:flutter/material.dart';
import 'package:time/data_viz/data_viz.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 250),
      child: SafeArea(child: DataViz()),
    );
  }
}
