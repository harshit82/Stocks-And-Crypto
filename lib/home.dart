import 'package:flutter/material.dart';
import 'package:stocks_and_crypto/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // function to return sliver app bar with the provided title
  SliverAppBar showSliverAppBar(String screenTitle) {
    return SliverAppBar(
      backgroundColor: const Color(backgroundColour),
      leading: const Padding(
        padding: EdgeInsets.all(10.0),
        child: CircleAvatar(
          backgroundImage:
              NetworkImage(randomImage), // TODO: Change with users image
        ),
      ),
      centerTitle: true,
      title: Text(screenTitle),
      floating: true,
      snap: false,
      pinned: true,
      bottom: const TabBar(indicatorColor: Color(tabIndicatorColour), tabs: [
        Tab(
          text: "Stocks",
        ),
        Tab(
          text: "Crypto",
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              showSliverAppBar("Dashboard"),
            ];
          },
          body: Container(),
        ),
      ),
    );
  }
}
