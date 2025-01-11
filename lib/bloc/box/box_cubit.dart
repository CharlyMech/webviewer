import 'package:webviewer/bloc/box/box_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webviewer/constants/boxes.dart';
import 'package:webviewer/models/web_page.dart';

class BoxCubit extends Cubit<BoxState> {
  BoxCubit() : super(const WebPagesBoxLoading());

  void loadWebPages() async {
    try {
      await Future.delayed(const Duration(seconds: 1)); //! TEMP
      final List<dynamic> webPages = webPageBox.values.toList();
      emit(WebPagesBoxLoaded(webPages));
    } catch (e) {
      emit(const WebPagesBoxError('Failed to load web pages'));
    }
  }

  void addWebPage(WebPage webPage) async {
    try {
      await webPageBox.add(webPage);
      final webPages = webPageBox.values.toList();
      emit(WebPagesBoxLoaded(webPages));
    } catch (e) {
      emit(const WebPagesBoxError('Failed to add web page'));
    }
  }

  void removeWebPage(WebPage webPage) async {
    try {
      await webPageBox.delete(webPage);
      final webPages = webPageBox.values.toList();
      emit(WebPagesBoxLoaded(webPages));
    } catch (e) {
      emit(const WebPagesBoxError('Failed to remove web page'));
    }
  }

  void removeAll() async {
    try {
      await webPageBox.clear();
      final webPages = webPageBox.values.toList();
      emit(WebPagesBoxLoaded(webPages));
    } catch (e) {
      emit(const WebPagesBoxError('Failed to remove web page'));
    }
  }

  WebPage getWebPageByUuid(String uuid) {
    final webPage =
        webPageBox.values.firstWhere((webPage) => webPage.uuid == uuid);
    return webPage;
  }

  void emitError(String message) {
    emit(WebPagesBoxError(message));
  }
}
