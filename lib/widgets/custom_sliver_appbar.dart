import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:webviewer/widgets/appbar_search.dart';
import 'package:webviewer/widgets/clipped_appbar.dart';
import 'package:webviewer/widgets/popup_menu.dart';

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
        const ClippedAppbar(
          height: 320,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, topPadding, 0, 0),
            child: PopupMenu(),
          ),
        ),
        // TODO -> WebViewer logo that disappears with scroll
        Positioned(
          bottom: offset + 15,
          child: GestureDetector(
            child: AppbarSearch(),
            onTap: () {
              //! This is temporary
              toastification.show(
                context: context,
                showProgressBar: false,
                alignment: Alignment.bottomCenter,
                title: const Text('This SearchBar is currently not enabled'),
                autoCloseDuration: const Duration(seconds: 5),
                type: ToastificationType.warning,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 320;

  @override
  double get minExtent => 160;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
