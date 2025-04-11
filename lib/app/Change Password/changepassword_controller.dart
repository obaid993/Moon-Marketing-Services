import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_marketing_services/app/api_helper/service_endpoints.dart';
import 'package:http/http.dart' as http;

enum PasswordType { oldPass, newPass }

class ChangePasswordController extends GetxController {
  final usernameController = TextEditingController().obs;
  final oldPasswordController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;

  RxBool isOldPasswordVisiable = false.obs;
  RxBool isNewPasswordVisiable = false.obs;

  changeVisible(PasswordType type) {
    if (type == PasswordType.newPass) {
      isNewPasswordVisiable.value = !isNewPasswordVisiable.value;
    } else {
      isOldPasswordVisiable.value = !isOldPasswordVisiable.value;
    }
  }

  // password change
  Future<void> changePassword() async {
    final url =
        "${SEP.BASE_URL}${SEP.changePassword}?username=${usernameController.value.text}&password=${oldPasswordController.value.text}&new_password=${newPasswordController.value.text}";

    try {
      final response = await http.post(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse["response"]["status"] == "ok") {
          Get.snackbar("Changed", 'Password Succesfully Changed');
        } else {
          Get.snackbar("Error", 'Failed to change password');
        }
      } else {
        Get.snackbar('Error', 'Failed to change password');
        throw Exception("Something went wrongs");
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      throw Exception("Something went wrong");
    }
  }
}






// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moon_marketing_services/app/Change%20Password/changepassword_model.dart';
// import 'package:moon_marketing_services/app/api_helper/service_endpoints.dart';
// import 'package:http/http.dart' as http;

// enum PasswordType { oldPass, newPass }

// class ChangePasswordController extends GetxController {
//   final usernameController = TextEditingController().obs;
//   final oldPasswordController = TextEditingController().obs;
//   final newPasswordController = TextEditingController().obs;

  

//    var isPasswordVisiable = false.obs;
//   RxBool isOldPasswordVisiable = false.obs;
//   RxBool isNewPasswordVisiable = false.obs;

//   changeVisible() {
//     isPasswordVisiable.value = !isPasswordVisiable.value;
//   changeVisible(PasswordType type) {
//     if (type == PasswordType.newPass) {
//       isNewPasswordVisiable.value = !isNewPasswordVisiable.value;
//     } else {
//       isOldPasswordVisiable.value = !isOldPasswordVisiable.value;
//     }
//   }

//   // password change
//   Future<ChangePasswordModel> changePassword() async {
//     final url =
//         "${SEP.BASE_URL}${SEP.changePassword}?username=${usernameController.value.text}&password=${oldPasswordController.value.text}&new_password=${newPasswordController.value.text}";
//     // final userName =
//     //     Get.find<ProfileScreenController>().profileModel.value.username;
  

//     try {
//       final response = await http.post(
//         Uri.parse(
//             url),
//       );
      

//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         final changePassword = ChangePasswordModel.fromJson(jsonResponse);

       

//         Get.snackbar("Changed", 'Password Succesfully Changed');
//         return changePassword;
//       } else {
//         Get.snackbar('Error', 'Failed to change password');
//         throw Exception("Something went wrongs");
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'An error occurred: $e');
//       throw Exception("Something went wrong");
//     }
//   }

//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   usernameController.value.dispose();
//   //   oldPasswordController.value.dispose();
//   //   newPasswordController.value.dispose();
//   // }
// }
// }