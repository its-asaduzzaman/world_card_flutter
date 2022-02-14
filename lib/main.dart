import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = countryData;
    List<Widget> listItems = [];
    for (var post in responseList) {
      listItems.add(TextButton(
        onPressed: () {},
        child: Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(100), blurRadius: 10.0),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post["name"],
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        post["subregion"],
                        style:
                            const TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        post["population"],
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Card(
                    child: Image.asset(
                      "assets/${post["image"]}",
                      height: 58,
                      width: 100,
                      fit: BoxFit.fitWidth,
                    ),
                    elevation: 18.0,
                  )
                ],
              ),
            )),
      ));
    }
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () {},
            )
          ],
        ),
        body: SizedBox(
          height: size.height,
          child: Column(
            children: <Widget>[
              const CategoriesScroller(),
              Expanded(
                child: ListView.builder(
                  itemCount: itemsData.length,
                  // itemCount: 3,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return itemsData[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class RegionCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        width: 150,
        height: categoryHeight,
        decoration: BoxDecoration(
          color: regionColor,
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
                "$regionName\nRegion",
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "$countries Countries",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
