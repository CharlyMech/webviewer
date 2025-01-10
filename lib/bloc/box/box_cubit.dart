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

  WebPage getWebPageByUuid(String uuid) {
    return webPageBox.get(uuid);
  }

  void emitError(String message) {
    emit(WebPagesBoxError(message));
  }
}
