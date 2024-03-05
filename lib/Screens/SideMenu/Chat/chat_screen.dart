import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter_android/webview_flutter_android.dart' as web;
// ignore: depend_on_referenced_packages
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart'
    as web;

import '../../../Utilities/constants.dart';
import '../../../widgets/Utilities/custom_appbar_widget.dart';


class ChatScreeen extends StatefulWidget {
  const ChatScreeen({super.key});
    static const String id = "chat";

  @override
  State<ChatScreeen> createState() => _ChatScreeenState();
}

class _ChatScreeenState extends State<ChatScreeen> {
  late final WebViewController _controller;
  var content = "";

  @override
  void initState() {
    super.initState();
    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    setupWebView();
    // #enddocregion platform_features
  }

  void setupWebView() {
    late final PlatformWebViewControllerCreationParams params;

    if (WebViewPlatform.instance is web.WebKitWebViewPlatform) {
      params = web.WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <web.PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            // if (request.url.startsWith('https://www.youtube.com/')) {
            //   debugPrint('blocking navigation to ${request.url}');
            //   return NavigationDecision.prevent;
            // }
            debugPrint('allowing navigation to ${request.url}');

            /// https://olearn.onesttech.com/payments/verify/Stripe?status=success
            // if (request.url.toLowerCase().contains("status=success")) {
            //   NavUtil.pushAndRemoveUntil(context, const BottomNavBar());
            // } else {
            //   // CustomDialog.showMessage(context);
            // }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      // ..loadHtmlString(content);
      ..loadRequest(Uri.parse("https://arabtesting.org:50136/"));

    // #docregion platform_features
    if (controller.platform is web.AndroidWebViewController) {
      web.AndroidWebViewController.enableDebugging(true);
      (controller.platform as web.AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Constants.WHITE_BACKGROUND,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "",
        ),
      ),body: WebViewWidget(controller: _controller));
  }
}
