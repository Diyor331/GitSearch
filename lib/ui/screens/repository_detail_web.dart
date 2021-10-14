import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RepoDetail extends StatefulWidget {
  static final routeName = 'repoDetail';
   final dynamic url;

  const RepoDetail({Key? key, this.url}) : super(key: key);
  @override
  _RepoDetailState createState() => _RepoDetailState();
}

class _RepoDetailState extends State<RepoDetail> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('Назад'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body:  WebView(
        initialUrl: widget.url,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
