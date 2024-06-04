import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_template/features/discover/components/grid_display_section.dart';
import 'package:prime_template/features/discover/components/shoe_card.dart';
import 'package:prime_template/features/discover/discover_provider.dart';
import 'package:prime_template/features/discover/views/filter.dart';
import 'package:prime_template/utils/colors.dart';
import 'package:prime_template/utils/constants.dart';
import 'package:provider/provider.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DiscoverProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discover",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                SvgPicture.asset("assets/icons/cart_full.svg")
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(brands.length, (index) {
                      var brand = brands[index];
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<DiscoverProvider>()
                              .selectACategory(brand);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Text(
                            brand,
                            style: TextStyle(
                                color: provider.selectedCat == brand
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
              ),
              Container(
                height: MediaQuery.sizeOf(context).height - 120,
                width: MediaQuery.sizeOf(context).width,
                child: ShoeDisplaySection(),
              )
            ],
          ),
          backgroundColor: Colors.white,
          bottomSheet: Container(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FilterPage()));
              },
              child: Container(
                width: 200,
                height: 40,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/filter1.svg',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Filter",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
