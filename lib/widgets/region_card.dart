import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RegionCard extends StatefulWidget {
  const RegionCard({
    Key? key,
    required this.categoryHeight,
    required this.regionName,
    required this.countries,
    required this.regionColor,
  }) : super(key: key);

  final double categoryHeight;
  final String regionName;
  final String countries;
  final Color regionColor;

  @override
  State<RegionCard> createState() => _RegionCardState();
}

class _RegionCardState extends State<RegionCard> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {});
      },
      child: Container(
        width: 150,
        height: widget.categoryHeight,
        decoration: BoxDecoration(
          color: widget.regionColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "${widget.regionName}\nRegion",
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${widget.countries} Countries",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
