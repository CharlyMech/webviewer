import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        // ? Temporary code
        toastification.show(
          context: context,
          showProgressBar: false,
          alignment: Alignment.bottomCenter,
          title: Text('$value selected'),
          autoCloseDuration: const Duration(seconds: 2),
          type: ToastificationType.info,
        );
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem(
          child: Text('Item 1'),
          value: 'ITEM 1',
        ),
        const PopupMenuItem(
          child: Text('Item 2'),
          value: 'ITEM 2',
        ),
        const PopupMenuItem(
          child: Text('Item 3'),
          value: 'ITEM 3',
        ),
      ],
    );
  }
}
