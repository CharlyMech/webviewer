import 'package:flutter/material.dart';
import 'package:webviewer/models/web_page.dart';

class WebPageTile extends StatelessWidget {
  final WebPage webPage;
  const WebPageTile({super.key, required this.webPage});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        webPage.title,
      ),
      trailing: const Icon(Icons.delete),
      subtitle: Text(webPage.description),
      // selected: true,
      onTap: () {},
    );
  }
}
