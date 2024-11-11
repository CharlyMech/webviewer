import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String title;
  final String url;
  const WebViewScreen({super.key, required this.title, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  int pageProgress = 0;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          // TODO -> Error screen for all these error types (make it agnostic)
          onPageStarted: (String url) {
            setState(() {
              pageProgress = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              pageProgress = progress;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              pageProgress = 100;
            });
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            elevation: 5,
            leading: IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () {
                context.pop();
              },
            ),
            actions: [
              Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    iconSize: 25,
                    onPressed: () async {
                      final messenger = ScaffoldMessenger.of(context);
                      if (await _controller.canGoBack()) {
                        await _controller.goBack();
                      } else {
                        messenger.showSnackBar(
                          const SnackBar(
                              duration: Duration(milliseconds: 200),
                              content: Text(
                                'Can\'t go back',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                        );
                        return;
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    iconSize: 25,
                    onPressed: () async {
                      final messenger = ScaffoldMessenger.of(context);
                      if (await _controller.canGoForward()) {
                        await _controller.goForward();
                      } else {
                        messenger.showSnackBar(
                          const SnackBar(
                              duration: Duration(milliseconds: 200),
                              content: Text(
                                'No forward history item',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                        );
                        return;
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.replay_rounded),
                    iconSize: 25,
                    onPressed: () {
                      _controller.reload();
                    },
                  ),
                ],
              )
            ]),
        body: Stack(children: [
          WebViewWidget(controller: _controller),
          pageProgress < 100
              ? LinearProgressIndicator(
                  value: pageProgress / 100.0,
                )
              : Container()
          /* Center(
              child: pageProgress < 100
                  ? LinearProgressIndicator(
                      value: pageProgress / 100.0,
                    )
                  : Container()) */
        ]));
  }
}
