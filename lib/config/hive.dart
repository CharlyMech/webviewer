import 'package:hive_flutter/hive_flutter.dart';
import 'package:webviewer/constants/boxes.dart';
import 'package:webviewer/models/web_page.dart';

Future<void> initHiveStorage() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WebPageAdapter());
  webPageBox = await Hive.openBox<WebPage>('webPagesBox');
}
