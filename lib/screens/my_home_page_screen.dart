import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:world_card/data/asia_region_countries.dart';
import 'package:world_card/widgets/category_card_scroller_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> asianRegionData = [];

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
      asianRegionData = listItems;
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
                  itemCount: asianRegionData.length,
                  // itemCount: 3,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return asianRegionData[index];
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
