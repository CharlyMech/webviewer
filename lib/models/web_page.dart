import 'package:hive/hive.dart';

part 'web_page.g.dart';

@HiveType(typeId: 1)
class WebPage {
  WebPage({
    required this.title,
    required this.description,
    required this.url,
  });

  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  String url;
}
