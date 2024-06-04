import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prime_template/utils/colors.dart';

class ShoeCard extends StatefulWidget {
  const ShoeCard({super.key});

  @override
  State<ShoeCard> createState() => _ShoeCardState();
}

class _ShoeCardState extends State<ShoeCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 210,
          minHeight: 200,
          minWidth: 170,
          maxWidth: 170,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 135,
              width: 170,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffF3F3F3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
                // image: DecorationImage(
                //   image: AssetImage('asset/images/test.png'),
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/nike.svg',
                    color: primaryNeutral,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/images/test2.png',
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Text(
              'Jordan 1 Retro High Tie Dye',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/star.svg',
                  height: 10,
                  width: 10,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '4.5',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '(1045 Reviews)',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                    color: primaryNeutral,
                  ),
                ),
              ],
            ),
            Text(
              '\$235,00',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
