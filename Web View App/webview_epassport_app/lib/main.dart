import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  late WebViewController controller;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Passport BD',
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.green[900])),
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller.clearCache();
                CookieManager().clearCookies();
              },
            ),
            title: Text('E-Passport BD'),
            actions: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () async {
                  if (await controller.canGoBack()) {
                    controller.goBack();
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () => controller.reload(),
              )
            ],
          ),
          body: Column(children: [
            LinearProgressIndicator(
              value: progress,
              color: Colors.red,
              backgroundColor: Colors.black12,
            ),
            Expanded(
              child: WebView(
                  onWebResourceError: (WebResourceError webviewerrr) {
                    print("Handle your error Page here");
                  },
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: "https://www.epassport.gov.bd/landing",
                  onPageFinished: (String url) {
                    print("Page finished here");
                  },
                  onWebViewCreated: (controller) {
                    this.controller = controller;
                  },
                  onProgress: (progress) =>
                      setState(() => this.progress = progress / 100)),
            )
          ])),
    );
  }

  setState(double Function() param0) {}
}
