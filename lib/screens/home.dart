import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:webviewer/widgets/custom_sliver_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliverAppbar(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 300,
                  color: Colors.purple,
                ),
                Container(
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 500,
                  color: Colors.cyan,
                ),
                Container(
                  height: 500,
                  color: Colors.lime,
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: Icon(Icons.add),
        color: Color(0xFFF8F8F8),
        iconSize: 40,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            return Color(0xFF6A00FF);
          }),
        ),
      ),
    );

    /* return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 5,
            scrolledUnderElevation: 5,
            backgroundColor: Color(0xFF6A00FF),
            toolbarHeight: 80,
            centerTitle: true,
            title: Text('WebViewer')),
        body: Container(
          color: Color(0xFF17203a), // Your desired background color
          child: Center(child: Text('Full Screen')),
        ),
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
          color: Color(0xFFF8F8F8),
          iconSize: 40,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              return Color(0xFF6A00FF);
            }),
          ),
        )); */
  }
}
