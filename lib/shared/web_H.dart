import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebSite2 extends StatelessWidget {
  final String url;
  WebSite2({required this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
