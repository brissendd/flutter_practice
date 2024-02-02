import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final List<String> pics = [
    'assets/pic1.jpg',
    'assets/pic2.jpg',
    'assets/pic3.jpg'
  ];
  PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: PageView.builder(
              itemCount: pics.length,
              controller: _controller,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return Image(image: AssetImage(pics[pagePosition]));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _indicators(pics.length, activePage),
          )
        ],
      ),
    );
  }
}

List<Widget> _indicators(int picsLength, int currentIndex) {
  return List<Widget>.generate(picsLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
