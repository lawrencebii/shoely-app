import 'package:flutter/material.dart';
import 'package:prime_template/features/discover/components/review_tile.dart';

class ReviewDisplaySection extends StatefulWidget {
  const ReviewDisplaySection({super.key});

  @override
  State<ReviewDisplaySection> createState() => _ReviewDisplaySectionState();
}

class _ReviewDisplaySectionState extends State<ReviewDisplaySection> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        ...List.generate(29, (index) => ReviewTile()),
      ],
    );
  }
}
