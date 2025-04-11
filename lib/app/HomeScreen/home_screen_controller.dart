import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController extends GetxController {
  void openWhatsup() async {
    const phoneNumber = "03015370001";

    var whatsUpUrlAndroid = "whatsapp://send?phone=$phoneNumber";

    try {
      // ignore: deprecated_member_use
      await launch(whatsUpUrlAndroid);
    } catch (e) {
      Get.snackbar("Error", "could not launch whatsup");
    }
  }
}
