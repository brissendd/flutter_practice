import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.cyan[300],
        child: CustomMultiChildLayout(
          delegate: OwnMultiChildLayoutDelegate(),
          children: [
            LayoutId(
              id: 1,
              child: Container(
                color: Colors.red,
                width: 100,
                height: 400,
              ),
            ),
            LayoutId(
              id: 2,
              child: Container(
                color: Colors.green[900],
                width: 300,
                height: 100,
              ),
            ),
            LayoutId(
              id: 3,
              child: Container(
                color: Colors.amber[900],
                width: 100,
                height: 400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OwnMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    final double mainAxisSize = size.width / 2;
    layoutChild(1, BoxConstraints.loose(Size(50, size.height)));
    positionChild(1, Offset(100, 100));
    layoutChild(2, BoxConstraints(minWidth: mainAxisSize, minHeight: 10));
    positionChild(2, Offset(200, 200));
    layoutChild(3, BoxConstraints(minWidth: mainAxisSize, minHeight: 10));
    positionChild(3, Offset(mainAxisSize, 400));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
