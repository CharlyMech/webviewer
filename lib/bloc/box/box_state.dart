import 'package:webviewer/models/web_page.dart';

abstract class BoxState {
  const BoxState();
}

class WebPagesBoxLoading extends BoxState {
  const WebPagesBoxLoading();
}

class WebPagesBoxLoaded extends BoxState {
  final List<dynamic> webPages;
  const WebPagesBoxLoaded(this.webPages);
}

class WebPagesBoxError extends BoxState {
  final String message;
  const WebPagesBoxError(this.message);
}
