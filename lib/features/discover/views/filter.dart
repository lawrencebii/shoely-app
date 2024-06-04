import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_template/features/discover/components/custom_button.dart';
import 'package:prime_template/features/discover/discover_provider.dart';
import 'package:prime_template/utils/colors.dart';
import 'package:prime_template/utils/constants.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double _currentMin = 0;
  double _currentMax = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: Consumer<DiscoverProvider>(
        builder: (context, provider, child) {
          double getMinWidth() {
            var usedWidth = MediaQuery.sizeOf(context).width - 100;

            try {
              var possibleDistanceFromMin = _currentMin * usedWidth / 1750;
              return possibleDistanceFromMin;
            } catch (e) {
              return 0.25 * usedWidth;
            }
          }

          double getMaxWidth() {
            var usedWidth = MediaQuery.sizeOf(context).width - 100;

            try {
              var possibleDistanceFromMin = _currentMax * usedWidth / 1750;
              // 30 for the min text size
              return (possibleDistanceFromMin - getMinWidth() - 30).abs();
            } catch (e) {
              return 0.25 * usedWidth;
            }
          }

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Brands',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(brandSvg.length, (index) {
                          var brand = brandSvg[index];
                          return Container(
                            height: 120,
                            width: 100,
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<DiscoverProvider>()
                                    .selectACategory(brand);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 70,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primaryNeutral1,
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  'assets/icons/${brand.toLowerCase()}.svg',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (brand == provider.selectedCat)
                                          Positioned(
                                            bottom: 6,
                                            right: 20,
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    brand,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '1001 items',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: primaryNeutral,
                                      fontSize: 11,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Price Range',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.sizeOf(context).width - 20,
                    child: Column(
                      children: [
                        RangeSlider(
                          min: 0,
                          max: 1750,
                          divisions: 175,
                          activeColor: Colors.black,
                          inactiveColor: primaryNeutral,
                          labels: RangeLabels(
                              "\$ ${_currentMin.floor().toString()}",
                              "\$ ${_currentMax.floor().toString()}"),
                          values: RangeValues(_currentMin, _currentMax),
                          onChanged: (values) {
                            setState(() {
                              _currentMin = values.start;
                              _currentMax = values.end;
                            });
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              "\$0",
                              style: TextStyle(
                                color: Color(0xffAAAAAA),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: getMinWidth(),
                                      ),
                                      Text(
                                        "\$${_currentMin.floor().toString()}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: getMaxWidth(),
                                      ),
                                      Text(
                                        "\$${_currentMax.floor().toString()}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "\$1750",
                              style: TextStyle(
                                color: Color(0xffAAAAAA),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sort By',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        sortContainer(true, "Most Recent"),
                        sortContainer(false, "Highest Price"),
                        sortContainer(false, "Lowest Price"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        sortContainer(true, "Man"),
                        sortContainer(false, "Woman"),
                        sortContainer(false, "Unisex"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Color',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        sortContainerColor(true, "Black", Colors.black),
                        sortContainerColor(false, "White", Colors.white),
                        sortContainerColor(false, "Red", Colors.red),
                        sortContainerColor(false, "Yellow", Colors.yellow),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        filled: false,
                        onpressd: () {},
                        label: "Reset (4)".toUpperCase(),
                      ),
                      CustomButton(
                        filled: true,
                        onpressd: () {},
                        label: "  APPLY  ",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget sortContainer(selected, val) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: selected ? Colors.black : null,
          border: Border.all(
            color: primaryNeutral,
          )),
      child: IntrinsicWidth(
        child: Center(
          child: Text(
            val,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget sortContainerColor(selected, val, color) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: selected ? Colors.black : primaryNeutral,
        ),
      ),
      child: IntrinsicWidth(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: color,
                  border: Border.all(
                    color: primaryNeutral,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                val,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
