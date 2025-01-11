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
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _goUrl(context, webPage.uuid),
        child: SizedBox(
          width: double.infinity,
          height: 85,
          child: Stack(alignment: AlignmentDirectional.topEnd, children: [
            Center(
              child: ListTile(
                enabled: false,
                minVerticalPadding: 10,
                title: Text(
                  webPage.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  webPage.url,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            IconButton(
                onPressed: () => context.read<BoxCubit>().removeAll(),
                icon: const Icon(Icons.delete)),
          ]),
        ),
      ),
    );
  }
}
