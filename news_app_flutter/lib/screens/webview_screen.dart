import 'package:flutter/material.dart';
import 'package:news_app_flutter/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebpageScreen extends StatelessWidget {
  String title = "";
  String uri = "";
  WebpageScreen({Key? key, required this.title, required this.uri})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: textStyle(14),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: WebView(
        initialUrl: uri,
      ),
    );
  }
}
