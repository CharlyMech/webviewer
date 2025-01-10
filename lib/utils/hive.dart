import 'package:webviewer/models/web_page.dart';

List<WebPage> fromBoxToWebPage(List<dynamic> boxList) {
  return boxList
      .map((item) => WebPage(
            uuid: item['uuid'],
            title: item['title'],
            description: item['description'],
            url: item['url'],
          ))
      .toList();
}
