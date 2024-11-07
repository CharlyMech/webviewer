import 'package:flutter/material.dart';
import 'package:webviewer/widgets/appbar_search.dart';
import 'package:webviewer/widgets/clipped_appbar.dart';

class CustomSliverAppbar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) * 0.5;
    double topPadding = MediaQuery.of(context).padding.top + 16;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClippedAppbar(
          height: 300,
        ),
        // TODO -> WebViewer logo that disappears with scroll
        Positioned(
          bottom: offset + 15,
          child: AppbarSearch(),
        ),
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
