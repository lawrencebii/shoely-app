import 'package:flutter/material.dart';
import 'package:prime_template/features/discover/components/review_display_section.dart';
import 'package:prime_template/features/discover/components/review_tile.dart';
import 'package:prime_template/features/discover/discover_provider.dart';
import 'package:prime_template/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DiscoverProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(ratingVals.length, (index) {
                      var rate = ratingVals[index];
                      return GestureDetector(
                        onTap: () {
                          context.read<DiscoverProvider>().selectARating(rate);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Text(
                            rate,
                            style: TextStyle(
                                color: provider.selectedCat == rate
                                    ? Colors.black
                                    : primaryNeutral,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height - 120,
                  width: MediaQuery.sizeOf(context).width,
                  child: ReviewDisplaySection(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
