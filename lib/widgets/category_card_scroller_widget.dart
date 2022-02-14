import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:world_card/widgets/region_card.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              RegionCard(
                categoryHeight: categoryHeight,
                regionName: 'Asia',
                countries: '48',
                regionColor: const Color(0xFF2D8587),
              ),
              RegionCard(
                categoryHeight: categoryHeight,
                regionName: 'Africa',
                countries: '54',
                regionColor: const Color(0xFF923E8A),
              ),
              RegionCard(
                categoryHeight: categoryHeight,
                regionName: 'Europe',
                countries: '44',
                regionColor: const Color(0xFF4B5C78),
              ),
              RegionCard(
                categoryHeight: categoryHeight,
                regionName: 'North America',
                countries: '23',
                regionColor: const Color(0xFFDF4D4B),
              ),
              RegionCard(
                categoryHeight: categoryHeight,
                regionName: 'South America',
                countries: '12',
                regionColor: const Color(0xFF922834),
              ),
              RegionCard(
                categoryHeight: categoryHeight,
                regionName: 'Oceania',
                countries: '14',
                regionColor: const Color(0xFFA8623B),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
