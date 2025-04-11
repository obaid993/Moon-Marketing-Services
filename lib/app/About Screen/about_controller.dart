

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';


class AboutScreenController extends GetxController{
 var webviewController = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //..setBackgroundColor(const Color(0x00000000))
  
     
    
     
  ..loadRequest(Uri.parse('https://www.moon.tristarsmarketing.com/about-us'));
}