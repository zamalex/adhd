import 'package:adhd/Models/media_response.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MediaWebView extends StatelessWidget {
  MediaWebView({super.key,this.video});

  Video? video;



  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            /* if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }*/
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(video!.video??''));

    print('url is ${video!.video}');
    return Scaffold(
      appBar: AppBar(title:  Text(video!.titleEn??'')),
      body: WebViewWidget(controller: controller),
    );
  }
}
