// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:moon_marketing_services/app/api_helper/service_endpoints.dart';
import 'package:moon_marketing_services/app/profile/model/customer_profile_model.dart';

import '../../bindings/app_binding.dart';

class LoginScreenController extends GetxController {
  late final userNameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool isLoginCorrect = false.obs;
  RxBool isLoading = false.obs;

  var isPasswordVisible = false.obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final getStorage = GetStorage();
  //  String get email => getStorage.read('Username') ?? '';
  // String get password => getStorage.read('Password') ?? '';
  // var email = "".obs;
  // var password = " ".obs;

  Future<CustomerProfileModel> loginApi() async {
    isLoading.value = true;

    final url =
        '${SEP.BASE_URL}${SEP.userLoginApi}username=${userNameController.value.text}&password=${passwordController.value.text}';
    final response = await http.post(Uri.parse(url));

    print("url is $url");
    print("details is $response");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("data $data");

      if (data["response"]["status"] == "ok") {
        // final LoginModel postData = LoginModel.fromJson(data);
        isLoading.value = false;
        getStorage.write("islogin", true);
        AppBindings().dependencies();
        // getStorage.write("userId", data["response"]["user_data"]["user_id"]);
        // getStorage.write("email", data["response"]["user_data"]["user_email"]);
        // getStorage.write(
        //     "fatherName", data["response"]["user_data"]["father_name"]);
        // getStorage.write(
        //     "mobileNumber", data["response"]["user_data"]["customer_mobile"]);
        // getStorage.write("customerAddress",
        //     data["response"]["user_data"]["customer_address"]);
        // getStorage.write(
        //     "customerWhatsapp", data["response"]["user_data"]["customerno"]);
        // getStorage.write(
        //     "userName", data["response"]["user_data"]["user_name"]);
        // getStorage.write("image", data["response"]["user_data"]["image"]);
        //

        CustomerProfileModel customerProfileModel; //  we store whole model

        customerProfileModel =
            CustomerProfileModel.fromJson(data["response"]["user_data"]);
        getStorage.write(
          "customeModel", // key of model
          customerProfileModel.toJson(),
        );

        return customerProfileModel;
      } else {
        isLoading.value = false;
        throw Exception(data["response"]["message"]);
      }
    } else {
      isLoading.value = false;
      throw Exception('Failed to Login.');
    }
  }

  @override
  void onClose() {
    userNameController.value.dispose();
    passwordController.value.dispose();
  }

  changeVisible() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // String? ValidEmail(String Value) {
  //   if (!GetUtils.isEmail(Value)) {
  //     return "Provide Valid Email";
  //   }
  //   return null;
  // }

  // String? ValidPassword(String Value) {
  //   if (Value.length < 6) {
  //     return "The Password must be six character";
  //   }
  //   return null;
  // }

  // void CheckLogin() {
  //   final isValid = LoginFormKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   LoginFormKey.currentState!.save();
  // }
}
