// ignore: file_names
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

openWhatsUp() async {
  const phoneNumber = "03139643516";

  var whatsUpUrlAndroid = "whatsapp://send?phone=$phoneNumber";
//final whatappurlIos = "https://wa.me/$phoneNumber?text=${Uri.parse("hello")}";

  try {
    // ignore: deprecated_member_use
    await launch(whatsUpUrlAndroid);
  } catch (e) {
    Get.snackbar("Error", "could not launch whatsup");
  }
}
