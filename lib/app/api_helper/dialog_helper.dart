import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: Colors.blue,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }

  static void showAlertDialogue({
    String? message,
    void Function()? onYes,
    void Function()? onNo,
  }) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message!,
              style: const TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    onPressed: onYes,
                    child: const Text(
                      'Yes',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                    ),
                TextButton(
                    onPressed: onNo,
                    child: const Text(
                      'No',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    )),
              ],
            )
          ],
        ),
      ),
    ));
  }

  static void responseMessage(String title, String message) =>
      Get.snackbar(title, '',
          messageText: Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.white,
          borderColor: Colors.black,
          borderRadius: 20,
          borderWidth: 3,
          colorText: Colors.black);
}
