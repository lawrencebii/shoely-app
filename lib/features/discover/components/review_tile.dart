import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_template/utils/colors.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(
        maxWidth: 360,
        minHeight: 100,
        maxHeight: 100,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    "Nolan Carder",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                          5,
                          (index) => SvgPicture.asset(
                                'assets/icons/star.svg',
                                height: 12,
                                width: 12,
                              ))
                    ],
                  )
                ],
              ),
              Expanded(child: SizedBox()),
              Text(
                "Today",
                style: TextStyle(
                  fontSize: 12,
                  color: primaryNeutral,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              "Perfect for keeping your feet dry and warm in damp conditions. ",
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
