import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webviewer/bloc/box/box_cubit.dart';
import 'package:webviewer/models/web_page.dart';

class WebPageTile extends StatelessWidget {
  final WebPage webPage;
  const WebPageTile({super.key, required this.webPage});

  void _goUrl(BuildContext context, String uuid) {
    context.push('/webpage?uuid=$uuid');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ListTile(
            title: Text(
              webPage.title,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              webPage.url,
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () => _goUrl(context, webPage.uuid),
          ),
          IconButton(
              onPressed: () {
                context.read<BoxCubit>().removeAll();
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
    );
  }
}
