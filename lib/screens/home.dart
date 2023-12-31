import 'package:class_travel_app/misc/colors.dart';
import 'package:class_travel_app/widget/app_large_text.dart';
import 'package:class_travel_app/widget/app_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'kayaking.png': 'Kayaking',
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'snorkling.png': 'Snorkling',
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //menu text
            Container(
              padding: const EdgeInsets.only(top: 80, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.menu, size: 30, color: Colors.black),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            //discover text
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const AppLargeText(text: 'Discover'),
            ),
            const SizedBox(height: 24),
            //tab bar
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: [
                    Tab(text: 'Places'),
                    Tab(text: 'Inspiration'),
                    Tab(text: 'Emotions'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: const DecorationImage(
                              image: AssetImage('img/mountain.jpeg'),
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                  Text('hello2'),
                  Text('hello3'),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: 'Explore more', size: 22),
                  AppText(text: 'See all', color: AppColors.textColor1),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 120,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 32),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                    'img/' + images.keys.elementAt(index),
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            child: AppText(
                              text: images.values.elementAt(index),
                              color: AppColors.textColor2,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  const CircleTabIndicator({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  const _CirclePainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
