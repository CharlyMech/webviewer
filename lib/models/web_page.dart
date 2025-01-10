import 'package:hive/hive.dart';

part 'web_page.g.dart';

@HiveType(typeId: 1)
class WebPage {
  WebPage({
    required this.uuid,
    required this.title,
    required this.description,
    required this.url,
  });

  @HiveField(0)
  String uuid;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String url;
}
