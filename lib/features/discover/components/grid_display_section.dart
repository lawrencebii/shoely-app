import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prime_template/features/discover/components/shoe_card.dart';

import '../../../utils/colors.dart';

class ShoeDisplaySection extends StatefulWidget {
  const ShoeDisplaySection({super.key});

  @override
  State<ShoeDisplaySection> createState() => _ShoeDisplaySectionState();
}

class _ShoeDisplaySectionState extends State<ShoeDisplaySection> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var itemWidth = 180.0; // Width of each item
      var crossAxisCount = (constraints.maxWidth / itemWidth).floor();
      return GridView.builder(
        itemCount: 100,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ShoeCard();
        },
      );
    });
  }
}
