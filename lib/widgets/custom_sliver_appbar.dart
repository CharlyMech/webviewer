import 'package:flutter/material.dart';
import 'package:iedib_wv/widgets/clipped_appbar.dart';

class CustomSliverAppbar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) * 0.5;
    double topPadding = MediaQuery.of(context).padding.top + 16;

    return Stack(
      children: [
        ClippedAppbar(
          height: 300,
        ),
        Positioned(top: topPadding + offset, child: Text('WebViewer'))
      ],
    );
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 140;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
